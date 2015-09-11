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
  
  UILabel *roomDetailLabel = [[UILabel alloc] init];
  [roomDetailLabel setTranslatesAutoresizingMaskIntoConstraints:false];
  roomDetailLabel.text = [NSString stringWithFormat:@"number:%@ | capacity:%@ | rate:%@", self.selectedRoom.number, self.selectedRoom.beds, self.selectedRoom.rate];
  roomDetailLabel.backgroundColor = [UIColor whiteColor];
  [rootView addSubview:roomDetailLabel];
  
  NSLayoutConstraint *roomDetailLabelCenterX = [NSLayoutConstraint constraintWithItem:roomDetailLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  roomDetailLabelCenterX.active = true;
  NSLayoutConstraint *roomDetailLabelTopConstraint = [NSLayoutConstraint constraintWithItem:roomDetailLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:150.0];
  roomDetailLabelTopConstraint.active = true;
  
  UITextField *firstNameTextField = [[UITextField alloc] init];
  [firstNameTextField setTranslatesAutoresizingMaskIntoConstraints:false];
  firstNameTextField.placeholder = @"First Name";
  firstNameTextField.backgroundColor = [UIColor yellowColor];
  [rootView addSubview:firstNameTextField];
  
  NSLayoutConstraint *firstNameTextFieldCenterX = [NSLayoutConstraint constraintWithItem:firstNameTextField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  firstNameTextFieldCenterX.active = true;
  NSLayoutConstraint *firstNameTextFieldTopConstraint = [NSLayoutConstraint constraintWithItem:firstNameTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:250.0];
  firstNameTextFieldTopConstraint.active = true;
  
  UITextField *lastNameTextField = [[UITextField alloc] init];
  [lastNameTextField setTranslatesAutoresizingMaskIntoConstraints:false];
  lastNameTextField.placeholder = @"Last Name";
  lastNameTextField.backgroundColor = [UIColor yellowColor];
  [rootView addSubview:lastNameTextField];
  
  NSLayoutConstraint *lastNameTextFieldCenterX = [NSLayoutConstraint constraintWithItem:lastNameTextField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  lastNameTextFieldCenterX.active = true;
  NSLayoutConstraint *lastNameTextFieldTopConstraint = [NSLayoutConstraint constraintWithItem:lastNameTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:300.0];
  lastNameTextFieldTopConstraint.active = true;

  
  
   self.view = rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
//   AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//  
//  Reservation *reservation = [NSEntityDescription insertNewObjectForEntityForName:@"Reservation" inManagedObjectContext:appDelegate.coreDataStack.managedObjectContext];
//  
//  reservation.startDate = self.selectedRoom.startdate;
//  reservation.endDate = self.selectedRoom.endDate;
//  
//  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
//  fetchRequest.predicate = [NSPredicate predicateWithFormat:@"number == 2"];
//  NSError *fetchError;
//  NSArray *results = [appDelegate.coreDataStack.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
//  if (results.count > 0) {
//    Room *room = results.firstObject;
//    reservation.room = room;
//    NSError *saveError;
//    if (![appDelegate.coreDataStack.managedObjectContext save:&saveError]) {
//      NSLog(@"%@",saveError.localizedDescription);
//    }
//    
//  }
  
  
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
