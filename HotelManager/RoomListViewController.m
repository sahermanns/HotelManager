//
//  RoomListViewController.m
//  HotelManager
//
//  Created by Sarah Hermanns on 9/8/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import "RoomListViewController.h"
#import "Room.h"
#import "AppDelegate.h"
#import "Hotel.h"

@interface RoomListViewController ()

@property (strong, nonatomic) NSArray *rooms;
@property (strong,nonatomic) UITableView *tableView;


@end

@implementation RoomListViewController

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
  
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"RoomCell"];
  
  self.rooms = [self.selectedHotel.rooms allObjects];
  
//  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
  
//  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//  NSManagedObjectContext* context = appDelegate.managedObjectContext;
//  
//  NSError *fetchError;
//  self.rooms = [context executeFetchRequest:fetchRequest error:&fetchError];
//  
//  if (fetchError) {
//    NSLog(@"%@",fetchError.localizedDescription);
//  }
//  
//  NSLog(@"%lu",(unsigned long)self.rooms.count);
//  
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  
  [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma TableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.rooms.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RoomCell" forIndexPath:indexPath];
  
  Room *room = self.rooms[indexPath.row];
  cell.textLabel.text = [NSString stringWithFormat:@"%@", room.number];
  
 
  return cell;
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
