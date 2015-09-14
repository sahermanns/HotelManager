//
//  SearchReservationsViewController.m
//  HotelManager
//
//  Created by Sarah Hermanns on 9/14/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import "SearchReservationsViewController.h"
#import "ReservationsListViewController.h"

@interface SearchReservationsViewController ()

@property (strong, nonatomic) UISearchBar *searchReservationsBar;
@property (strong, nonatomic) NSString *lastName;

@end

@implementation SearchReservationsViewController

-(void)loadView {
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  
//  UISearchBar *searchReservationsBar = [[UISearchBar alloc] init];
//  [searchReservationsBar addObserver:<#(NSObject *)#> forKeyPath:self.lastName options:<#(NSKeyValueObservingOptions)#> context:<#(void *)#>;
//  searchReservationsBar.placeholder = @"Last Name";
//  [searchReservationsBar setTranslatesAutoresizingMaskIntoConstraints:false];
//   searchReservationsBar.backgroundColor = [UIColor yellowColor];
//  
//   [rootView addSubview:searchReservationsBar];
//   
//   NSLayoutConstraint *searchReservationsBarCenterX = [NSLayoutConstraint constraintWithItem:searchReservationsBar attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
//   searchReservationsBarCenterX.active = true;
//   NSLayoutConstraint *searchReservationsBarCenterY = [NSLayoutConstraint constraintWithItem:searchReservationsBar attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:200.0];
//   searchReservationsBarCenterY.active = true;

  
  UIButton *searchButton = [[UIButton alloc] init];
  [searchButton addTarget:self action:@selector(searchButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
  [searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [searchButton setTitle: NSLocalizedString(@"Search Reservations", @"the title of the search reservations button")  forState:UIControlStateNormal];
  [searchButton setTranslatesAutoresizingMaskIntoConstraints:false];
  searchButton.backgroundColor = [UIColor redColor];
  
  [rootView addSubview:searchButton];
  
  NSLayoutConstraint *searchButtonCenterX = [NSLayoutConstraint constraintWithItem:searchButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  searchButtonCenterX.active = true;
  NSLayoutConstraint *searchButtonCenterY = [NSLayoutConstraint constraintWithItem:searchButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:200.0];
  searchButtonCenterY.active = true;
  
  
  self.view = rootView;
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
   
   -(void)searchButtonPressed:(UIButton *)sender {
     
     ReservationsListViewController *destinationVC = [[ReservationsListViewController alloc] init];
     
     [self.navigationController pushViewController:destinationVC animated:true];
     
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
