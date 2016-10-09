//
//  BusRoute.m
//  Bus Buddy
//
//  Created by Tejas Deshpande on 10/9/16.
//  Copyright © 2016 Tejas Deshpande. All rights reserved.
//

#import "BusRoute.h"

@implementation BusRoute

- (instancetype)initWithBusName:(NSString *)busName time: (NSString *)time onTimeOrLate: (NSString *)onTimeOrLate isLate:(BOOL)isLate {
    self = [super init];
    if (self) {
        self.busName = busName;
        self.busTime = time;
        self.onTimeOrLate = onTimeOrLate;
        self.isLate = isLate;
    }
    
    return self;
}

@end
