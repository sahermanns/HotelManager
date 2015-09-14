//
//  ReservationService.h
//  HotelManager
//
//  Created by Sarah Hermanns on 9/9/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataStack.h"
#import "Guest.h"

@interface ReservationService : NSObject

+ (NSArray *)availableRoomsForStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;
+ (void)bookReservationForStartDate:(NSDate *)startDate endDate:(NSDate *)endDate forRoomNumber:(NSNumber *)roomNumber forRoomGuest: (Guest *) roomGuest;

@end
