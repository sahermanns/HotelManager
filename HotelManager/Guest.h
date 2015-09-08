//
//  Guest.h
//  HotelManager
//
//  Created by Sarah Hermanns on 9/7/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Hotel, Reservation, Room;

@interface Guest : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) Hotel *hotel;
@property (nonatomic, retain) Room *room;
@property (nonatomic, retain) Reservation *reservation;

@end
