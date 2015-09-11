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
@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;
//@property (strong, nonatomic) NSString  *firstName;
//@property (strong, nonatomic) NSString *lastName;

@end
