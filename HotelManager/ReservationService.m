//
//  ReservationService.m
//  HotelManager
//
//  Created by Sarah Hermanns on 9/9/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import "ReservationService.h"
#import "Hotel.h"
#import "Room.h"
#import "Reservation.h"
#import "CoreDataStack.h"
#import "AppDelegate.h"
#import "Guest.h"

@implementation ReservationService

+ (NSArray *)availableRoomsForStartDate:(NSDate *)startDate endDate:(NSDate *)endDate {
  
  if (!startDate || !endDate) {
    return [[NSArray alloc] init];
  }
  
  AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
  
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
  
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"startDate <= %@ AND endDate >= %@",endDate,startDate];
  
  request.predicate = predicate;
  NSError *fetchError;
  NSArray *results = [appDelegate.coreDataStack.managedObjectContext executeFetchRequest:request error:&fetchError];
  
  NSMutableArray *badRooms = [[NSMutableArray alloc] init];
  for (Reservation *reservation in results) {
    [badRooms addObject:reservation.room];
  }
  
  NSFetchRequest *finalRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
  NSPredicate *finalPredicate = [NSPredicate predicateWithFormat:@"NOT self IN %@", badRooms];
  finalRequest.predicate = finalPredicate;
  
  NSError *finalError;
  
  NSArray *finalResults = [appDelegate.coreDataStack.managedObjectContext executeFetchRequest:finalRequest error:&finalError];
  
  if (finalError) {
    return nil;
  }
  
  return finalResults;
  
}

+ (void)bookReservationForStartDate:(NSDate *)startDate endDate:(NSDate *)endDate forRoomNumber:(NSNumber *)roomNumber forRoomGuest: (Guest *) roomGuest {
  
  AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
  
  Reservation *reservation = [NSEntityDescription insertNewObjectForEntityForName:@"Reservation" inManagedObjectContext:appDelegate.coreDataStack.managedObjectContext];
  
  reservation.startDate = startDate;
  reservation.endDate = endDate;
  reservation.guest = roomGuest;
  
  
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
  NSString *predicateString = [NSString stringWithFormat:@"number == %@", roomNumber];
  fetchRequest.predicate = [NSPredicate predicateWithFormat:predicateString];
  NSError *fetchError;
  NSArray *results = [appDelegate.coreDataStack.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];

  
  if (results.count > 0) {
    Room *room = results.firstObject;
    reservation.room = room;
    NSError *saveError;
    if (![appDelegate.coreDataStack.managedObjectContext save:&saveError]) {
      NSLog(@"%@",saveError.localizedDescription);
    } else {
      NSLog(@"Your reservation was saved");
    }
  }
}



@end
