//
//  AvailableRoomsViewController.h
//  HotelManager
//
//  Created by Sarah Hermanns on 9/9/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AvailableRoomsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;
@property (strong, nonatomic) NSArray *rooms;

@end
