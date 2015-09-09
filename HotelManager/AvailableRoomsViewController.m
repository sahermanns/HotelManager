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

@interface AvailableRoomsViewController ()

@property (strong,nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *hotels;

@end

@implementation AvailableRoomsViewController

-(void)loadView {
  UIView *rootView = [[UIView alloc] init];
  
  UITableView *tableView = [[UITableView alloc] initWithFrame:rootView.frame style:UITableViewStylePlain];
  self.tableView = tableView;
  [tableView setTranslatesAutoresizingMaskIntoConstraints:false];
  [rootView addSubview:tableView];
  
  NSDictionary *views = @{@"tableView" : tableView};
  
  NSArray *tableViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:views];
  [rootView addConstraints:tableViewVerticalConstraints];
  NSArray *tableViewHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views];
  [rootView addConstraints:tableViewHorizontalConstraints];
  
  self.view = rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
  NSDate *checkIn = [NSDate date];
  NSDate *checkOut = [NSDate dateWithTimeInterval:86400 * 2 sinceDate:[NSDate date]];
  
  
  [self fetchAvailableRoomsForFromDate:checkIn toDate:checkOut];
  
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"AvailableRoomsCell"];
  
//  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//  NSManagedObjectContext* context = appDelegate.managedObjectContext;
//  
//  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"AvailableRoomsCell"];
//  
//  NSError *fetchError;
//  self.hotels = [context executeFetchRequest:fetchRequest error:&fetchError];
//  
//  if (fetchError) {
//    NSLog(@"%@",fetchError.localizedDescription);
//  }
//  
//  NSLog(@"%lu",(unsigned long)self.hotels.count);
  
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  
  [self.tableView reloadData];
}

-(NSArray *)fetchAvailableRoomsForFromDate:(NSDate*)fromDate toDate:(NSDate *)toDate {
  
  AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
  
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
  
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"checkIn <= %@ AND checkOut >= %@",toDate,fromDate];
  request.predicate = predicate;
  NSError *fetchError;
  NSArray *results = [appDelegate.managedObjectContext executeFetchRequest:request error:&fetchError];
  
  NSMutableArray *badRooms = [[NSMutableArray alloc] init];
  for (Reservation *reservation in results) {
    [badRooms addObject:reservation.room];
  }
  
  NSFetchRequest *finalRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
  NSPredicate *finalPredicate = [NSPredicate predicateWithFormat:@"NOT self IN %@", badRooms];
  finalRequest.predicate = finalPredicate;
  
  NSError *finalError;
  
  NSArray *finalResults = [appDelegate.managedObjectContext executeFetchRequest:finalRequest error:&finalError];
  
  if (finalError) {
    return nil;
  }
  return finalResults;
  
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.hotels.count;
  
  
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AvailableRoomsCell" forIndexPath:indexPath];
  
//  Hotel *hotel = self.hotels[indexPath.row];
//  cell.textLabel.text = hotel.name;
  
  
  return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  BookReservationViewController *destinationVC = [[BookReservationViewController alloc] init];
  
  [self.navigationController pushViewController:destinationVC animated:true];
  
//  indexPath = self.tableView.indexPathForSelectedRow;
//  Hotel *selectedHotel = self.hotels[indexPath.row];
//  destinationVC.selectedHotel = selectedHotel;
  
}

@end
