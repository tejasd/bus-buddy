//
//  BusScheduleTableViewCell.m
//  Bus Buddy
//
//  Created by Tejas Deshpande on 10/8/16.
//  Copyright © 2016 Tejas Deshpande. All rights reserved.
//

#import "BusScheduleTableViewCell.h"
#import "BusRoute.h"

@interface BusScheduleTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *busName;
@property (weak, nonatomic) IBOutlet UILabel *busTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *onTimeLabel;

@end

@implementation BusScheduleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setBusRoute:(BusRoute *)busRoute {
    self.busName.text = busRoute.busName;
    self.busTimeLabel.text = busRoute.busTime;
    self.onTimeLabel.text = busRoute.onTimeOrLate;
    self.onTimeLabel.textColor = busRoute.isLate ? [UIColor redColor] : [UIColor colorWithRed:0 green:102 blue:0 alpha:1];
}

@end
