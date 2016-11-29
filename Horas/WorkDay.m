//
//  WorkDay.m
//  Horas
//
//  Created by Ricardo Maqueda on 16/9/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import "WorkDay.h"

@interface WorkDay ()

@property (nonatomic, copy) NSArray *binnacles;

@end

@implementation WorkDay

+ (NSString *)tableName {
    return @"workday";
}

- (void)addBinnacle:(Binnacle *)binnacle {
    NSMutableArray *binnaclesMutable = self.binnacles.mutableCopy;
    [binnaclesMutable addObject:binnacle];
    self.binnacles = binnaclesMutable;
}

- (void)deleteBinnacle:(Binnacle *)binnacle {
    NSMutableArray *binnaclesMutable = self.binnacles.mutableCopy;
    [binnaclesMutable removeObject:binnacle];
    self.binnacles = binnaclesMutable;
}

#pragma mark - Validation

//- (BOOL)isCurrentDate:(Binnacle *)binnacle {
//    if (binnacle.date i) {
//        <#statements#>
//    }
//}

@end
