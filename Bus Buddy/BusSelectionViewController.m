//
//  BusSelectionViewController.m
//  Bus Buddy
//
//  Created by Tejas Deshpande on 10/8/16.
//  Copyright © 2016 Tejas Deshpande. All rights reserved.
//

#import "BusSelectionViewController.h"
#import "BusScheduleTableViewCell.h"
#import "BusRoute.h"

@interface BusSelectionViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *dummyImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray <BusRoute *> *busRoutes;

@end

@implementation BusSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // Fake data - fetch this from somewhere
    self.busRoutes = @[
                       [[BusRoute alloc] initWithBusName:@"EB 445" time:@"6:45 AM - 7:30 AM" onTimeOrLate:@"On-time (98%)" isLate:NO],
                       [[BusRoute alloc] initWithBusName:@"AM 887" time:@"6:40 AM - 7:25 AM" onTimeOrLate:@"On-time (95%)" isLate:NO],
                       [[BusRoute alloc] initWithBusName:@"EB 445" time:@"7:15 AM - 8:00 AM" onTimeOrLate:@"Often late (9%)" isLate:YES],
                       [[BusRoute alloc] initWithBusName:@"EB 445" time:@"7:30 AM - 8:15 AM" onTimeOrLate:@"Often late (11%)" isLate:YES],
                       [[BusRoute alloc] initWithBusName:@"EB 445" time:@"7:45 AM - 8:30 AM" onTimeOrLate:@"Often late (10%)" isLate:YES],
                       [[BusRoute alloc] initWithBusName:@"EB 446" time:@"6:45 AM - 8:15 AM" onTimeOrLate:@"Often late (40%)" isLate:YES]
                       ];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* cellID = @"Cell";
    
    BusScheduleTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
//    if (cell == nil) {
//        cell = (BusScheduleTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"BusScheduleTableViewCell" owner:self options:nil] firstObject];
//    }
    
    [cell setBusRoute:self.busRoutes[indexPath.row]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.busRoutes.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
