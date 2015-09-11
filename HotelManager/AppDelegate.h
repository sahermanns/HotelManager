//
//  AppDelegate.h
//  HotelManager
//
//  Created by Sarah Hermanns on 9/7/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAI.h"

@class RootViewController;
@class NavController;
@class CoreDataStack;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CoreDataStack *coreDataStack;
@property(nonatomic, strong) id<GAITracker> tracker;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

