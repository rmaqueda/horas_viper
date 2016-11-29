//
//  WorkDay.h
//  Horas
//
//  Created by Ricardo Maqueda on 16/9/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersistableObjectProtocol.h"
#import "Binnacle.h"

@interface WorkDay : NSObject <PersistableObjectProtocol>

@property (nonatomic, strong, readonly) NSDate *date;
@property (nonatomic, copy, readonly) NSArray *binnacles;
@property (nonatomic, readonly) NSTimeInterval *seconds;

- (void)addBinnacle:(Binnacle *)binnacle;
- (void)deleteBinnacle:(Binnacle *)binnacle;

@end
