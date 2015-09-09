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
  [browseHotelsButton setTitle:@"Browse Hotels" forState:UIControlStateNormal];
  [browseHotelsButton setTranslatesAutoresizingMaskIntoConstraints:false];
  browseHotelsButton.backgroundColor = [UIColor redColor];
  
  [rootView addSubview:browseHotelsButton];
  
  NSLayoutConstraint *browseHotelsButtonCenterX = [NSLayoutConstraint constraintWithItem:browseHotelsButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  browseHotelsButtonCenterX.active = true;
  NSLayoutConstraint *browseHotelsButtonCenterY = [NSLayoutConstraint constraintWithItem:browseHotelsButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-50.0];
  browseHotelsButtonCenterY.active = true;
//  NSLayoutConstraint *browseHotelsButtonTopConstraint = [NSLayoutConstraint constraintWithItem:browseHotelsButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-8];
//  browseHotelsButtonTopConstraint.active = true;
  
  UIButton *bookARoomButton = [[UIButton alloc] init];
  [bookARoomButton addTarget:self action:@selector(bookARoomButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
  [bookARoomButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [bookARoomButton setTitle:@"Book A Room" forState:UIControlStateNormal];
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
  [lookUpReservationButton setTitle:@"Look Up Reservation" forState:UIControlStateNormal];
  [lookUpReservationButton setTranslatesAutoresizingMaskIntoConstraints:false];
  lookUpReservationButton.backgroundColor = [UIColor yellowColor];
  
  [rootView addSubview:lookUpReservationButton];
  
  NSLayoutConstraint *lookUpReservationButtonCenterX = [NSLayoutConstraint constraintWithItem:lookUpReservationButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  lookUpReservationButtonCenterX.active = true;
  NSLayoutConstraint *lookUpReservationButtonCenterY = [NSLayoutConstraint constraintWithItem:lookUpReservationButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:50.00];
  lookUpReservationButtonCenterY.active = true;
  
  
//  UILabel *greenLabel = [[UILabel alloc] init];
//  [greenLabel setTranslatesAutoresizingMaskIntoConstraints:false];
//  greenLabel.text = @"Hotels";
//  greenLabel.backgroundColor = [UIColor greenColor];
//  [rootView addSubview:greenLabel];

  
//  UILabel *greenLabel = [[UILabel alloc] init];
//  [greenLabel setTranslatesAutoresizingMaskIntoConstraints:false];
//  greenLabel.text = @"Go hawks";
//  greenLabel.backgroundColor = [UIColor greenColor];
//  [rootView addSubview:greenLabel];
//  
//  NSDictionary *views = @{@"browseHotelsButton" : browseHotelsButton, @"bookARoomButton" : bookARoomButton, @"lookUpReservationButton" : lookUpReservationButton};
  
//  NSArray *redViewHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[redView]-|" options:0 metrics:nil views:views];
//  [rootView addConstraints:redViewHorizontalConstraints];
//  
//  NSArray *redViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[redView]-100-|" options:0 metrics:nil views:views];
//  [rootView addConstraints:redViewVerticalConstraints];
//  
//  NSArray *greenLabelVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView]-[greenLabel]" options:0 metrics:nil views:views];
//  [rootView addConstraints:greenLabelVerticalConstraints];
  
    //  NSArray *greenLabelHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[greenLabel]" options:0 metrics:nil views:views];
    //  [rootView addConstraints:greenLabelHorizontalConstraints];
//  NSLayoutConstraint *greenLabelCenterXConstraint = [NSLayoutConstraint constraintWithItem:greenLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
//    //[rootView addConstraint:greenLabelCenterXConstraint];
// greenLabelCenterXConstraint.active = true;
  
  
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
  
}


@end
