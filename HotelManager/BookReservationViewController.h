//
//  BookReservationViewController.h
//  HotelManager
//
//  Created by Sarah Hermanns on 9/8/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Room;
@class Reservation;

@interface BookReservationViewController : UIViewController

@property (strong, nonatomic) Room *selectedRoom;
@property (strong, nonatomic) Reservation *firstName;
@property (strong, nonatomic) Reservation *lastName;

@end
