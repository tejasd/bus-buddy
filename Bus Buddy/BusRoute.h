//
//  BusRoute.h
//  Bus Buddy
//
//  Created by Tejas Deshpande on 10/9/16.
//  Copyright © 2016 Tejas Deshpande. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusRoute : NSObject

@property (nonatomic, strong) NSString *busName;
@property (nonatomic, strong) NSString *busTime;
@property (nonatomic, strong) NSString *onTimeOrLate;
@property (nonatomic, assign) BOOL isLate;

- (instancetype)initWithBusName:(NSString *)busName time: (NSString *)time onTimeOrLate: (NSString *)onTimeOrLate isLate:(BOOL)isLate;

@end
