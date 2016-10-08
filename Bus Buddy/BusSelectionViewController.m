//
//  BusSelectionViewController.m
//  Bus Buddy
//
//  Created by Tejas Deshpande on 10/8/16.
//  Copyright © 2016 Tejas Deshpande. All rights reserved.
//

#import "BusSelectionViewController.h"
#import "BusScheduleTableViewCell.h"

@interface BusSelectionViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *dummyImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BusSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* cellID = @"Cell";
    
    BusScheduleTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = (BusScheduleTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"BusScheduleTableViewCell" owner:self options:nil] firstObject];
    }
    
    cell.busName.text = @"EB 123";
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
    
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
