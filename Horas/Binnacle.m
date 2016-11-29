//
//  Binnacle.m
//  Horas
//
//  Created by Ricardo Maqueda on 16/9/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import "Binnacle.h"

@implementation Binnacle

+ (NSString *)tableName {
    return @"binacle";
}

- (instancetype)initWithtype:(BinnacleType)type
                        date:(NSDate *)date {
    if (self = [super init]) {
        _type = type;
        _date = date;
    }
    
    return self;
}

#pragma mark - NSCoder

- (id)initWithCoder:(NSCoder *)decoder {
    NSInteger type = [decoder decodeIntegerForKey:@"type"];
    NSDate *date = [decoder decodeObjectForKey:@"date"];
    
    return [self initWithtype:type date:date];
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_date forKey:@"date"];
    [encoder encodeInteger:_type forKey:@"type"];
}

@end
