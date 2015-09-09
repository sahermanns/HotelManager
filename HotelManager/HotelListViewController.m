//
//  HotelListViewController.m
//  HotelManager
//
//  Created by Sarah Hermanns on 9/8/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import "HotelListViewController.h"
#import "Hotel.h"
#import "AppDelegate.h"
#import "RoomListViewController.h"
#import "Reservation.h"

@interface HotelListViewController () 

@property (strong,nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *hotels;

@end

@implementation HotelListViewController

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
  
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HotelCell"];
  
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  NSManagedObjectContext* context = appDelegate.managedObjectContext;
  
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
  
  NSError *fetchError;
  self.hotels = [context executeFetchRequest:fetchRequest error:&fetchError];
  
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
  return self.hotels.count;
  
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotelCell" forIndexPath:indexPath];
  
  Hotel *hotel = self.hotels[indexPath.row];
  cell.textLabel.text = hotel.name;


  return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  RoomListViewController *destinationVC = [[RoomListViewController alloc] init];
  
  [self.navigationController pushViewController:destinationVC animated:true];
  indexPath = self.tableView.indexPathForSelectedRow;
  Hotel *selectedHotel = self.hotels[indexPath.row];
  destinationVC.selectedHotel = selectedHotel;
  
}

@end
