//
//  Room.h
//  HotelManager
//
//  Created by Sarah Hermanns on 9/10/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Guest, Hotel, Reservation;

@interface Room : NSManagedObject

@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSNumber * beds;
@property (nonatomic, retain) NSNumber * rate;
@property (nonatomic, retain) Hotel *hotel;
@property (nonatomic, retain) NSSet *guest;
@property (nonatomic, retain) NSSet *reservation;
@end

@interface Room (CoreDataGeneratedAccessors)

- (void)addGuestObject:(Guest *)value;
- (void)removeGuestObject:(Guest *)value;
- (void)addGuest:(NSSet *)values;
- (void)removeGuest:(NSSet *)values;

- (void)addReservationObject:(Reservation *)value;
- (void)removeReservationObject:(Reservation *)value;
- (void)addReservation:(NSSet *)values;
- (void)removeReservation:(NSSet *)values;

@end
