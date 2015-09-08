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

@interface HotelListViewController () 


@property (strong, nonatomic) NSArray *hotels;

@end

@implementation HotelListViewController


- (void)viewDidLoad {
    [super viewDidLoad];

  
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  
  UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
  [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HotelCell"];
  [rootView addSubview: tableView];
  
  self.view = rootView;
  
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  NSManagedObjectContext* context = appDelegate.managedObjectContext;
  
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
  
  NSError *fetchError;
  self.hotels = [context executeFetchRequest:fetchRequest error:&fetchError];
  
  NSLog(@"%lu",(unsigned long)self.hotels.count);
  
  tableView.delegate = self;
  tableView.dataSource = self;
  
  [tableView reloadData];
  
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
  [self performSegueWithIdentifier:@"showRoomList" sender:self];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//  if ([segue.identifier isEqualToString:@"showRoomList"]){
//     NSIndexPath *indexPath = [UITableView indexPathForCell:sender];
//  }
//
//}



@end
