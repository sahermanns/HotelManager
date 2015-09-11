//
//  BookReservationViewController.m
//  HotelManager
//
//  Created by Sarah Hermanns on 9/8/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import "BookReservationViewController.h"
#import "Reservation.h"
#import "AppDelegate.h"
#import "Room.h"
#import "Hotel.h"
#import "CoreDataStack.h"
#import "ReservationService.h"
#import "ViewController.h"


@interface BookReservationViewController ()

@end

@implementation BookReservationViewController

-(void)loadView {
  
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  
  UILabel *reserveRoomLabel = [[UILabel alloc] init];
  [reserveRoomLabel setTranslatesAutoresizingMaskIntoConstraints:false];
  reserveRoomLabel.text = @"Reserve This Room";
  reserveRoomLabel.backgroundColor = [UIColor whiteColor];
  [rootView addSubview:reserveRoomLabel];
  
  NSLayoutConstraint *reserveRoomLabelCenterX = [NSLayoutConstraint constraintWithItem:reserveRoomLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  reserveRoomLabelCenterX.active = true;
  NSLayoutConstraint *reserveRoomLabelTopConstraint = [NSLayoutConstraint constraintWithItem:reserveRoomLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:100.0];
  reserveRoomLabelTopConstraint.active = true;
  
  UILabel *fromDateLabel = [[UILabel alloc] init];
  [fromDateLabel setTranslatesAutoresizingMaskIntoConstraints:false];
  fromDateLabel.text = @"From Date - To Date";
  fromDateLabel.backgroundColor = [UIColor whiteColor];
  [rootView addSubview:fromDateLabel];
  
  NSLayoutConstraint *fromDateLabelCenterX = [NSLayoutConstraint constraintWithItem:fromDateLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  fromDateLabelCenterX.active = true;
  NSLayoutConstraint *fromDateLabelTopConstraint = [NSLayoutConstraint constraintWithItem:fromDateLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:150.0];
  fromDateLabelTopConstraint.active = true;
  
  UILabel *roomDetailLabel = [[UILabel alloc] init];
  [roomDetailLabel setTranslatesAutoresizingMaskIntoConstraints:false];
  roomDetailLabel.text = [NSString stringWithFormat:@"number:%@ ", self.selectedRoom.number];
  roomDetailLabel.backgroundColor = [UIColor whiteColor];
  [rootView addSubview:roomDetailLabel];
  
  NSLayoutConstraint *roomDetailLabelCenterX = [NSLayoutConstraint constraintWithItem:roomDetailLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  roomDetailLabelCenterX.active = true;
  NSLayoutConstraint *roomDetailLabelTopConstraint = [NSLayoutConstraint constraintWithItem:roomDetailLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:175.0];
  roomDetailLabelTopConstraint.active = true;
  
  UILabel *roomCapacityLabel = [[UILabel alloc] init];
  [roomCapacityLabel setTranslatesAutoresizingMaskIntoConstraints:false];
  roomCapacityLabel.text = [NSString stringWithFormat:@"Number of Beds:%@",  self.selectedRoom.beds];
  roomCapacityLabel.backgroundColor = [UIColor whiteColor];
  [rootView addSubview:roomCapacityLabel];
  
  NSLayoutConstraint *roomCapacityLabelCenterX = [NSLayoutConstraint constraintWithItem:roomCapacityLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  roomCapacityLabelCenterX.active = true;
  NSLayoutConstraint *roomCapacityLabelTopConstraint = [NSLayoutConstraint constraintWithItem:roomCapacityLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:200.0];
  roomCapacityLabelTopConstraint.active = true;
  
  UILabel *roomRateLabel = [[UILabel alloc] init];
  [roomRateLabel setTranslatesAutoresizingMaskIntoConstraints:false];
  roomRateLabel.text = [NSString stringWithFormat:@"Price of Room:%@",  self.selectedRoom.rate];
  roomRateLabel.backgroundColor = [UIColor whiteColor];
  [rootView addSubview:roomRateLabel];
  
  NSLayoutConstraint *roomRateLabelCenterX = [NSLayoutConstraint constraintWithItem:roomRateLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  roomRateLabelCenterX.active = true;
  NSLayoutConstraint *roomRateLabelTopConstraint = [NSLayoutConstraint constraintWithItem:roomRateLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:225.0];
  roomRateLabelTopConstraint.active = true;
  
  UITextField *firstNameTextField = [[UITextField alloc] init];
  [firstNameTextField setTranslatesAutoresizingMaskIntoConstraints:false];
  firstNameTextField.placeholder = @"First Name";
  firstNameTextField.backgroundColor = [UIColor yellowColor];
//  firstNameTextField.resignFirstResponder;
  [rootView addSubview:firstNameTextField];
  
  NSLayoutConstraint *firstNameTextFieldCenterX = [NSLayoutConstraint constraintWithItem:firstNameTextField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  firstNameTextFieldCenterX.active = true;
  NSLayoutConstraint *firstNameTextFieldTopConstraint = [NSLayoutConstraint constraintWithItem:firstNameTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:350.0];
  firstNameTextFieldTopConstraint.active = true;
  
  UITextField *lastNameTextField = [[UITextField alloc] init];
  [lastNameTextField setTranslatesAutoresizingMaskIntoConstraints:false];
  lastNameTextField.placeholder = @"Last Name";
  lastNameTextField.backgroundColor = [UIColor yellowColor];
  [rootView addSubview:lastNameTextField];
  
  NSLayoutConstraint *lastNameTextFieldCenterX = [NSLayoutConstraint constraintWithItem:lastNameTextField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  lastNameTextFieldCenterX.active = true;
  NSLayoutConstraint *lastNameTextFieldTopConstraint = [NSLayoutConstraint constraintWithItem:lastNameTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:400.0];
  lastNameTextFieldTopConstraint.active = true;
  
  UIButton *confirmButton = [[UIButton alloc] init];
  [confirmButton addTarget:self action:@selector(confirmButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
  [confirmButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [confirmButton setTitle:@"Confirm" forState:UIControlStateNormal];
  [confirmButton setTranslatesAutoresizingMaskIntoConstraints:false];
  confirmButton.backgroundColor = [UIColor redColor];
  
  [rootView addSubview:confirmButton];
  
  NSLayoutConstraint *confirmButtonCenterX = [NSLayoutConstraint constraintWithItem:confirmButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  confirmButtonCenterX.active = true;
  NSLayoutConstraint *confirmButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:confirmButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-50.0];
  confirmButtonBottomConstraint.active = true;

  
  
   self.view = rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
  
  
  
}

-(void)confirmButtonPressed:(UIButton *)sender {
  
  [ReservationService bookReservationForStartDate:self.startDate endDate:self.endDate forRoomNumber:self.selectedRoom.number];
  ViewController *destinationVC = [[ViewController alloc] init];
  [self.navigationController pushViewController:destinationVC animated:true];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
