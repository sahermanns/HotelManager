//
//  ViewController.m
//  HotelManager
//
//  Created by Sarah Hermanns on 9/7/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import "ViewController.h"
#import "HotelListViewController.h"
#import "DatePickerViewController.h"
#import "SearchReservationsViewController.h"

#import "GAI.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView {
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  
//  UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//  [redView setTranslatesAutoresizingMaskIntoConstraints:false];
//  redView.backgroundColor = [UIColor redColor];
//  [rootView addSubview:redView];
  
  UIButton *browseHotelsButton = [[UIButton alloc] init];
  [browseHotelsButton addTarget:self action:@selector(browseHotelsButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
  [browseHotelsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [browseHotelsButton setTitle: NSLocalizedString(@"Browse Hotels", @"the title of the browse hotels button")  forState:UIControlStateNormal];
  [browseHotelsButton setTranslatesAutoresizingMaskIntoConstraints:false];
  browseHotelsButton.backgroundColor = [UIColor redColor];
  
  [rootView addSubview:browseHotelsButton];
  
  NSLayoutConstraint *browseHotelsButtonCenterX = [NSLayoutConstraint constraintWithItem:browseHotelsButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  browseHotelsButtonCenterX.active = true;
  NSLayoutConstraint *browseHotelsButtonCenterY = [NSLayoutConstraint constraintWithItem:browseHotelsButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-50.0];
  browseHotelsButtonCenterY.active = true;
  
  UIButton *bookARoomButton = [[UIButton alloc] init];
  [bookARoomButton addTarget:self action:@selector(bookARoomButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
  [bookARoomButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [bookARoomButton setTitle: NSLocalizedString(@"Book A Room", @"the title of the booking a room button") forState:UIControlStateNormal];
  [bookARoomButton setTranslatesAutoresizingMaskIntoConstraints:false];
  bookARoomButton.backgroundColor = [UIColor grayColor];
  
  [rootView addSubview:bookARoomButton];
  
  NSLayoutConstraint *bookARoomButtonCenterX = [NSLayoutConstraint constraintWithItem:bookARoomButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
 bookARoomButtonCenterX.active = true;
  NSLayoutConstraint *bookARoomButtonCenterY = [NSLayoutConstraint constraintWithItem:bookARoomButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
  bookARoomButtonCenterY.active = true;
  
  UIButton *lookUpReservationButton = [[UIButton alloc] init];
  [lookUpReservationButton addTarget:self action:@selector(lookUpReservationButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
  [lookUpReservationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [lookUpReservationButton setTitle: NSLocalizedString(@"Search Reservations", @"the title of the search reservations button") forState:UIControlStateNormal];
  [lookUpReservationButton setTranslatesAutoresizingMaskIntoConstraints:false];
  lookUpReservationButton.backgroundColor = [UIColor yellowColor];
  
  [rootView addSubview:lookUpReservationButton];
  
  NSLayoutConstraint *lookUpReservationButtonCenterX = [NSLayoutConstraint constraintWithItem:lookUpReservationButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  lookUpReservationButtonCenterX.active = true;
  NSLayoutConstraint *lookUpReservationButtonCenterY = [NSLayoutConstraint constraintWithItem:lookUpReservationButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:50.00];
  lookUpReservationButtonCenterY.active = true;
  
  
  self.view = rootView;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}
-(void)browseHotelsButtonPressed:(UIButton *)sender {
  
  HotelListViewController *destinationVC = [[HotelListViewController alloc] init];
  
  [self.navigationController pushViewController:destinationVC animated:true];
  
}
-(void)bookARoomButtonPressed:(UIButton *)sender {
  
  DatePickerViewController *destinationVC = [[DatePickerViewController alloc] init];
  
  [self.navigationController pushViewController:destinationVC animated:true];

  
}
-(void)lookUpReservationButtonPressed:(UIButton *)sender {
  
  SearchReservationsViewController *destinationVC = [[SearchReservationsViewController alloc] init];
  
  [self.navigationController pushViewController:destinationVC animated:true];

  
}


@end
