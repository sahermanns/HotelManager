//
//  AppDelegate.m
//  HotelManager
//
//  Created by Sarah Hermanns on 9/7/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Guest.h"
#import "Hotel.h"
#import "Room.h"
#import "Reservation.h"
#import "DatePickerViewController.h"
#import "BookReservationViewController.h"
#import "HotelListViewController.h"
#import "CoreDataStack.h"
//#import <GAI.h>

/******* Set your tracking ID here *******/
static NSString *const kTrackingId = @"UA-67485025-1";
static NSString *const kAllowTracking = @"allowTracking";


@interface AppDelegate ()

  // Used for sending Google Analytics traffic in the background.
@property(nonatomic, assign) BOOL okToWait;
@property(nonatomic, copy) void (^dispatchHandler)(GAIDispatchResult result);

@end



@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  NSDictionary *appDefaults = @{kAllowTracking: @(YES)};
  [[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];
    // User must be able to opt out of tracking
  [GAI sharedInstance].optOut =
  ![[NSUserDefaults standardUserDefaults] boolForKey:kAllowTracking];
  
   self.coreDataStack = [[CoreDataStack alloc] init];

//  instantiate main screen of the app here
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  [self.window makeKeyAndVisible];
  
  ViewController *viewController = [[ViewController alloc] init];
  
  UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
  self.window.rootViewController = navigationController;
  
  return YES;
}

-(void)application:(UIApplication *)application
performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
  [self sendHitsInBackground];
  completionHandler(UIBackgroundFetchResultNewData);
}



- (void)sendHitsInBackground {
  self.okToWait = YES;
  __weak AppDelegate *weakSelf = self;
  __block UIBackgroundTaskIdentifier backgroundTaskId =
  [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
    weakSelf.okToWait = NO;
  }];
  
  if (backgroundTaskId == UIBackgroundTaskInvalid) {
    return;
  }
  
  self.dispatchHandler = ^(GAIDispatchResult result) {
      // If the last dispatch succeeded, and we're still OK to stay in the background then kick off
      // again.
    if (result == kGAIDispatchGood && weakSelf.okToWait ) {
      [[GAI sharedInstance] dispatchWithCompletionHandler:weakSelf.dispatchHandler];
    } else {
      [[UIApplication sharedApplication] endBackgroundTask:backgroundTaskId];
    }
  };
  [[GAI sharedInstance] dispatchWithCompletionHandler:self.dispatchHandler];
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   [self sendHitsInBackground];
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  [GAI sharedInstance].optOut =
  ![[NSUserDefaults standardUserDefaults] boolForKey:kAllowTracking];
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  // Saves changes in the application's managed object context before the application terminates.
  [self saveContext];
}



@end
