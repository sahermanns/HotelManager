//
//  Reservation.h
//  HotelManager
//
//  Created by Sarah Hermanns on 9/10/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Guest, Hotel, Room;

@interface Reservation : NSManagedObject

@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSDate * endDate;
@property (nonatomic, retain) Room *room;
@property (nonatomic, retain) Guest *guest;
@property (nonatomic, retain) Hotel *hotel;

@end
