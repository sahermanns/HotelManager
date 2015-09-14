//
//  ReservationsListViewController.m
//  HotelManager
//
//  Created by Sarah Hermanns on 9/14/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import "ReservationsListViewController.h"
#import "Reservation.h"
#import "Guest.h"
#import "AppDelegate.h"
#import "ReservationService.h"
#import "CoreDataStack.h"
#import "Room.h"

@interface ReservationsListViewController () <UISearchBarDelegate>

@property (strong, nonatomic) UISearchBar *searchReservationsBar;
@property (strong, nonatomic) NSString *lastName;
@property (strong,nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *reservations;

@end

@implementation ReservationsListViewController

-(void)loadView {
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  
  UISearchBar *searchReservationsBar = [[UISearchBar alloc] init];
  searchReservationsBar.text = @"Last Name";
  [searchReservationsBar setTranslatesAutoresizingMaskIntoConstraints:false];
  searchReservationsBar.backgroundColor = [UIColor yellowColor];

   [rootView addSubview:searchReservationsBar];

  NSLayoutConstraint *searchReservationsBarCenterX = [NSLayoutConstraint constraintWithItem:searchReservationsBar attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
   searchReservationsBarCenterX.active = true;
  NSLayoutConstraint *searchReservationsBarTopConstraint = [NSLayoutConstraint constraintWithItem:searchReservationsBar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:100.0];
  searchReservationsBarTopConstraint.active = true;
  NSLayoutConstraint *searchReservationsBarWidthConstraint = [NSLayoutConstraint constraintWithItem:searchReservationsBar attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:300.0];
  searchReservationsBarWidthConstraint.active = true;
  
  UITableView *tableView = [[UITableView alloc] initWithFrame:rootView.frame style:UITableViewStylePlain];
  self.tableView = tableView;
  [tableView setTranslatesAutoresizingMaskIntoConstraints:false];
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
  self.searchReservationsBar.delegate = self;
  
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ReservationCell"];
  
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
  
  NSError *fetchError;
  self.reservations = [appDelegate.coreDataStack.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
  
  if (fetchError) {
    NSLog(@"%@",fetchError.localizedDescription);
  }
  
  NSLog(@"%lu",(unsigned long)self.reservations.count);
  
  [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.reservations.count;
  
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReservationCell" forIndexPath:indexPath];
  
  Reservation *reservation = self.reservations[indexPath.row];
  cell.textLabel.text = [NSString stringWithFormat:@"number:%@ guest:%@", reservation.room.number, reservation.guest.lastName];
  
  
  return cell;
}



@end
