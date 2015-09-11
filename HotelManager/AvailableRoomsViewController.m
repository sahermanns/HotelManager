//
//  AvailableRoomsViewController.m
//  HotelManager
//
//  Created by Sarah Hermanns on 9/9/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import "AvailableRoomsViewController.h"
#import "BookReservationViewController.h"
#import "Hotel.h"
#import "AppDelegate.h"
#import "Reservation.h"
#import "CoreDataStack.h"
#import "Room.h"
#import "ReservationService.h"

#import "GAI.h"

@interface AvailableRoomsViewController ()

@property (strong,nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *hotels;

@end

@implementation AvailableRoomsViewController

-(void)loadView {
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  
  UILabel *fromDateLabel = [[UILabel alloc] init];
  [fromDateLabel setTranslatesAutoresizingMaskIntoConstraints:false];
  fromDateLabel.text = [NSString stringWithFormat:@"%@", self.startDate];
  fromDateLabel.backgroundColor = [UIColor whiteColor];
  [rootView addSubview:fromDateLabel];
  
  NSLayoutConstraint *fromDateLabelCenterX = [NSLayoutConstraint constraintWithItem:fromDateLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-50.0];
  fromDateLabelCenterX.active = true;
  NSLayoutConstraint *fromDateLabelTopConstraint = [NSLayoutConstraint constraintWithItem:fromDateLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:100.0];
  fromDateLabelTopConstraint.active = true;
  
  UILabel *toDateLabel = [[UILabel alloc] init];
  [toDateLabel setTranslatesAutoresizingMaskIntoConstraints:false];
  toDateLabel.text = [NSString stringWithFormat:@"%@", self.endDate];
  toDateLabel.backgroundColor = [UIColor whiteColor];
  [rootView addSubview:toDateLabel];
  
  NSLayoutConstraint *toDateLabelCenterX = [NSLayoutConstraint constraintWithItem:toDateLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:50.0];
 toDateLabelCenterX.active = true;
  NSLayoutConstraint *toDateLabelTopConstraint = [NSLayoutConstraint constraintWithItem:toDateLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:100.0];
  toDateLabelTopConstraint.active = true;
  
  UITableView *tableView = [[UITableView alloc] initWithFrame:rootView.frame style:UITableViewStylePlain];
  self.tableView = tableView;
  [tableView setTranslatesAutoresizingMaskIntoConstraints:false];
  [tableView setRowHeight:100];
  [rootView addSubview:tableView];
  
  NSDictionary *views = @{@"tableView" : tableView};
  
  NSArray *tableViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[tableView]|" options:0 metrics:nil views:views];
  [rootView addConstraints:tableViewVerticalConstraints];
  NSArray *tableViewHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views];
  [rootView addConstraints:tableViewHorizontalConstraints];
  
  self.view = rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  
  NSLog(@"startdate: %@", self.endDate);
  self.rooms = [ReservationService availableRoomsForStartDate:self.startDate endDate:self.endDate];
  NSLog(@"%@", self.rooms);
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"AvailableRoomsCell"];
  
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];

  NSError *fetchError;
  self.hotels = [appDelegate.coreDataStack.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];

  if (fetchError) {
    NSLog(@"%@",fetchError.localizedDescription);
  }

  NSLog(@"%lu",(unsigned long)self.hotels.count);
  
  
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  
  [self.tableView reloadData];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSLog(@"number of rooms in array: %lu", (unsigned long)self.rooms.count);
  return self.rooms.count;
  
  
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AvailableRoomsCell" forIndexPath:indexPath];
  
//  UITableViewCell *otherCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Available"];
  
  Room *room = self.rooms[indexPath.row];
  NSLog(@"%@", room.number);
  cell.textLabel.numberOfLines = 0;
  cell.textLabel.text = [NSString stringWithFormat:@"number:%@\n capacity:%@\n rate:%@", room.number, room.beds, room.rate];
//  cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, room capacity: %@", room.beds, room.rate];
  
  return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  BookReservationViewController *destinationVC = [[BookReservationViewController alloc] init];
  
  [self.navigationController pushViewController:destinationVC animated:true];
  
  indexPath = self.tableView.indexPathForSelectedRow;
  Room *selectedRoom = self.rooms[indexPath.row];
  destinationVC.selectedRoom = selectedRoom;
  destinationVC.startDate = self.startDate;
  destinationVC.endDate = self.endDate;

  
  
}

@end
