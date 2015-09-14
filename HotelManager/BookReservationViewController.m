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
#import "Guest.h"
#import "GAI.h"
#import <CoreData/CoreData.h>


@interface BookReservationViewController () <UITextFieldDelegate>

@property (strong,nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) NSString  *firstName;
@property (strong, nonatomic) NSString *lastName;

@property (strong, nonatomic) UITextField *lastNameTextField;
@property (strong, nonatomic) UITextField *firstNameTextField;

@end

@implementation BookReservationViewController

-(void)loadView {
  
  self.dateFormatter = [[NSDateFormatter alloc] init];
  self.dateFormatter.dateStyle = NSDateFormatterShortStyle;
  
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
  NSString *startDate = [self.dateFormatter stringFromDate:self.startDate];
  NSString *endDate = [self.dateFormatter stringFromDate:self.endDate];
  fromDateLabel.text = [NSString stringWithFormat:@"%@ - %@", startDate, endDate];
  fromDateLabel.backgroundColor = [UIColor whiteColor];
  [rootView addSubview:fromDateLabel];
  
  NSLayoutConstraint *fromDateLabelCenterX = [NSLayoutConstraint constraintWithItem:fromDateLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant: 0.0];
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
  
  self.firstNameTextField = [[UITextField alloc] init];
  [self.firstNameTextField setTranslatesAutoresizingMaskIntoConstraints:false];
  self.firstNameTextField.placeholder = @"First Name";
  self.firstNameTextField.backgroundColor = [UIColor yellowColor];
 
  [rootView addSubview:self.firstNameTextField];
  
  NSLayoutConstraint *firstNameTextFieldCenterX = [NSLayoutConstraint constraintWithItem:self.firstNameTextField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  firstNameTextFieldCenterX.active = true;
  NSLayoutConstraint *firstNameTextFieldTopConstraint = [NSLayoutConstraint constraintWithItem:self.firstNameTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:350.0];
  firstNameTextFieldTopConstraint.active = true;
  
  self.lastNameTextField = [[UITextField alloc] init];
  [self.lastNameTextField setTranslatesAutoresizingMaskIntoConstraints:false];
  self.lastNameTextField.placeholder = @"Last Name";
  self.lastNameTextField.backgroundColor = [UIColor yellowColor];
  [rootView addSubview:self.lastNameTextField];
  
  NSLayoutConstraint *lastNameTextFieldCenterX = [NSLayoutConstraint constraintWithItem:self.lastNameTextField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  lastNameTextFieldCenterX.active = true;
  NSLayoutConstraint *lastNameTextFieldTopConstraint = [NSLayoutConstraint constraintWithItem:self.lastNameTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:400.0];
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
  
  self.firstNameTextField.delegate = self;
  self.lastNameTextField.delegate = self;
  
}

-(void)confirmButtonPressed:(UIButton *)sender {
  
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  
  
  Guest *guest = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:appDelegate.coreDataStack.managedObjectContext];
  
   guest.lastName = self.lastNameTextField.text;
  guest.firstName = self.firstNameTextField.text;
  
  [ReservationService bookReservationForStartDate:self.startDate endDate:self.endDate forRoomNumber:self.selectedRoom.number forRoomGuest:guest];
  [self.navigationController popToRootViewControllerAnimated:true];

  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
  
  [textField resignFirstResponder];
  
  return true;
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
