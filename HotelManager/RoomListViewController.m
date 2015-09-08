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

@interface RoomListViewController ()

@property (strong, nonatomic) NSArray *rooms;


@end

@implementation RoomListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  
  UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
  [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"RoomCell"];
  [rootView addSubview: tableView];
  
  self.view = rootView;
  
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
  
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  NSManagedObjectContext* context = appDelegate.managedObjectContext;
  
  
  NSError *fetchError;
  NSArray *results = [context executeFetchRequest:fetchRequest error:&fetchError];
  
  NSLog(@"%lu",(unsigned long)results.count);
  
  tableView.delegate = self;
  tableView.dataSource = self;
  
  [tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma TableView

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RoomCell" forIndexPath:indexPath];
  
    //  var room = rooms[indexPath.row]
 
  return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 10;
    //  return hotels.count;
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
