//
//  DatePickerViewController.m
//  HotelManager
//
//  Created by Sarah Hermanns on 9/8/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import "DatePickerViewController.h"
#import "DatePickerEndViewController.h"

#import "GAI.h"

@interface DatePickerViewController ()

@property (strong,nonatomic) UIDatePicker *datePicker;
@property (strong,nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation DatePickerViewController

-(void)loadView {
  
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  
  UIDatePicker *datePicker = [[UIDatePicker alloc] init];
  self.datePicker = datePicker;
  [datePicker setTranslatesAutoresizingMaskIntoConstraints:false];
  
  [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];

  [rootView addSubview:datePicker];
  
  NSLayoutConstraint *datePickerCenterX = [NSLayoutConstraint constraintWithItem:datePicker attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  datePickerCenterX.active = true;
  NSLayoutConstraint *datePickerCenterY = [NSLayoutConstraint constraintWithItem:datePicker attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
  datePickerCenterY.active = true;
  
  UIButton *nextButton = [[UIButton alloc] init];
  [nextButton addTarget:self action:@selector(nextButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
  [nextButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [nextButton setTitle:@"Next" forState:UIControlStateNormal];
  [nextButton setTranslatesAutoresizingMaskIntoConstraints:false];
  
  [rootView addSubview:nextButton];
  
  NSLayoutConstraint *nextButtonCenterX = [NSLayoutConstraint constraintWithItem:nextButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  nextButtonCenterX.active = true;
  NSLayoutConstraint *nextButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:nextButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-8];
  nextButtonBottomConstraint.active = true;

  UILabel *checkInLabel = [[UILabel alloc] init];
  [checkInLabel setTranslatesAutoresizingMaskIntoConstraints:false];
  checkInLabel.text = @"Check In Date";
  checkInLabel.backgroundColor = [UIColor whiteColor];
  [rootView addSubview:checkInLabel];
  
  NSLayoutConstraint *checkInLabelCenterX = [NSLayoutConstraint constraintWithItem:checkInLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  checkInLabelCenterX.active = true;
  NSLayoutConstraint *checkInLabelTopConstraint = [NSLayoutConstraint constraintWithItem:checkInLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:100.0];
  checkInLabelTopConstraint.active = true;
  
  self.view = rootView;
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
  self.datePicker.datePickerMode = UIDatePickerModeDate;
  self.dateFormatter = [[NSDateFormatter alloc] init];
  self.dateFormatter.dateStyle = NSDateFormatterShortStyle;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)nextButtonPressed:(UIButton *)sender {
  
  DatePickerEndViewController *destinationVC = [[DatePickerEndViewController alloc] init];
  destinationVC.startDate = self.datePicker.date;
  self.dateFormatter.dateStyle = NSDateFormatterShortStyle;
  [self.navigationController pushViewController:destinationVC animated:true];
  
  
}

-(void)datePickerValueChanged:(UIDatePicker *)sender {
  
  self.dateFormatter.dateStyle = NSDateFormatterShortStyle;
//  [self.dateFormatter setDateFormat:@"MMMM dd yyyy"];
  NSString *dateString = [self.dateFormatter stringFromDate:sender.date];
  NSLog(@"%@",dateString);
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
