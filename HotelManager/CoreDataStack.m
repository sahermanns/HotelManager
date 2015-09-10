//
//  CoreDataStack.m
//  HotelManager
//
//  Created by Sarah Hermanns on 9/9/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import "CoreDataStack.h"
#import "Hotel.h"
#import "Room.h"

@interface CoreDataStack()

@property (nonatomic) BOOL testing;

@end

@implementation CoreDataStack


@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;


#pragma mark - Core Data Stack
- (instancetype)init
{
  self = [super init];
  if (self) {
    [self seedCoreDataIfNeeded];
  }
  return self;
}

- (instancetype)initForTesting {
  self = [super init];
  if (self) {
    self.testing = true;
  }
  return self;
}

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "SASH.HotelManager" in the application's documents directory.
  return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
  if (_managedObjectModel != nil) {
    return _managedObjectModel;
  }
  NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"HotelManager" withExtension:@"momd"];
  _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
  return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
  if (_persistentStoreCoordinator != nil) {
    return _persistentStoreCoordinator;
  }
  
    // Create the coordinator and store
  
  _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
  NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"HotelManager.sqlite"];
  NSError *error = nil;
  NSString *failureReason = @"There was an error creating or loading the application's saved data.";
  if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
      // Report any error we got.
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
    dict[NSLocalizedFailureReasonErrorKey] = failureReason;
    dict[NSUnderlyingErrorKey] = error;
    error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
      // Replace this with code to handle the error appropriately.
      // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    abort();
  }
  
  return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
  if (_managedObjectContext != nil) {
    return _managedObjectContext;
  }
  
  NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
  if (!coordinator) {
    return nil;
  }
  _managedObjectContext = [[NSManagedObjectContext alloc] init];
  [_managedObjectContext setPersistentStoreCoordinator:coordinator];
  return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
  NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
  if (managedObjectContext != nil) {
    NSError *error = nil;
    if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
      NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
      abort();
    }
  }
}

#pragma mark - Helper Methods

-(void)seedCoreDataIfNeeded {
  
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
  NSError *fetchError;
  NSInteger count = [self.managedObjectContext countForFetchRequest:fetchRequest error:&fetchError];
  if (count == 0) {
      //we need to seed our database
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"hotels" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];

    NSError *jsonError;
    NSDictionary *rootObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];
    if (jsonError) {
      return;
    }
    
    if([rootObject isKindOfClass:[NSDictionary class]]) {
      NSArray *hotels = rootObject[@"Hotels"];
      
      for (id hotel in hotels) {
        Hotel *currentHotel = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:self.managedObjectContext];
        currentHotel.name = hotel[@"name"];
        currentHotel.location = hotel[@"location"];
        currentHotel.stars = hotel[@"stars"];
        
        NSArray *rooms = hotel[@"rooms"];
        
        for (id room in rooms) {
          Room *currentRoom = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
          currentRoom.number = room[@"number"];
          currentRoom.beds = room[@"beds"];
          currentRoom.rate = room[@"rate"];
          currentRoom.hotel = currentHotel;
          
          NSError *roomError;
          BOOL roomResult = [self.managedObjectContext save:&roomError];
          if (!roomResult) {
            NSLog(@" %@",roomError.localizedDescription);
          }
          [currentHotel addRoomsObject:currentRoom];
        }
        
        NSError *hotelError;
        BOOL hotelResult = [self.managedObjectContext save:&hotelError];
        if (!hotelResult) {
          NSLog(@" %@",hotelError.localizedDescription);
        }

      }
    }
//    Hotel *hotel1 = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:self.managedObjectContext];
//    hotel1.name = @"Four Seasons";
//    hotel1.stars = @5;
//    
//    Hotel *hotel2 = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:self.managedObjectContext];
//    hotel2.name = @"Mariot";
//    hotel2.stars = @3;
//    
//    Hotel *hotel3 = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:self.managedObjectContext];
//    hotel3.name = @"Holiday Inn";
//    hotel3.stars = @2;
//    
//    Hotel *hotel4 = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:self.managedObjectContext];
//    hotel4.name = @"Hilton";
//    hotel4.stars = @4;
//    
//    
//    
//    Room *room1 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
//    room1.number = @1;
//    room1.hotel = hotel1;
//    
//    Room *room2 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
//    room2.number = @2;
//    room2.hotel = hotel1;
//    
//    Room *room3 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
//    room3.number = @3;
//    room3.hotel = hotel2;
//    
//    Room *room4 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
//    room4.number = @4;
//    room4.hotel = hotel2;
//    
//    Room *room5 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
//    room5.number = @5;
//    room5.hotel = hotel3;
//    
//    Room *room6 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
//    room6.number = @6;
//    room6.hotel = hotel3;
//    
//    Room *room7 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
//    room7.number = @7;
//    room7.hotel = hotel4;
//    
//    Room *room8 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
//    room8.number = @8;
//    room8.hotel = hotel4;
    

    }
    
  }


@end
