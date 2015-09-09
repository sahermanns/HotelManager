//
//  RoomListViewController.h
//  HotelManager
//
//  Created by Sarah Hermanns on 9/8/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Hotel;

@interface RoomListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) Hotel *selectedHotel;

@end
