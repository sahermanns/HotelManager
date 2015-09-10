//
//  Hotel.h
//  HotelManager
//
//  Created by Sarah Hermanns on 9/10/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Guest, Reservation, Room;

@interface Hotel : NSManagedObject

@property (nonatomic, retain) NSNumber * stars;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSSet *rooms;
@property (nonatomic, retain) NSSet *guest;
@property (nonatomic, retain) NSSet *reservation;
@end

@interface Hotel (CoreDataGeneratedAccessors)

- (void)addRoomsObject:(Room *)value;
- (void)removeRoomsObject:(Room *)value;
- (void)addRooms:(NSSet *)values;
- (void)removeRooms:(NSSet *)values;

- (void)addGuestObject:(Guest *)value;
- (void)removeGuestObject:(Guest *)value;
- (void)addGuest:(NSSet *)values;
- (void)removeGuest:(NSSet *)values;

- (void)addReservationObject:(Reservation *)value;
- (void)removeReservationObject:(Reservation *)value;
- (void)addReservation:(NSSet *)values;
- (void)removeReservation:(NSSet *)values;

@end
