//
//  Binnacle.h
//  Horas
//
//  Created by Ricardo Maqueda on 16/9/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersistableObjectProtocol.h"


typedef NS_ENUM(NSInteger, BinnacleType) {
    BinnacleTypeInput = 1,
    BinnacleTypeOutput = 2
};


@interface Binnacle : NSObject <PersistableObjectProtocol, NSCoding>

@property (nonatomic, readonly) BinnacleType type;
@property (nonatomic, strong, readonly) NSDate *date;

- (instancetype)initWithtype:(BinnacleType)type
                        date:(NSDate *)date;

@end
