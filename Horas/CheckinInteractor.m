//
//  CheckinInteractor.m
//  Horas
//
//  Created by Ricardo Maqueda on 16/9/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import "CheckinInteractor.h"
#import "Binnacle.h"

@interface CheckinInteractor ()

@property (nonatomic, copy) NSArray *binnacles;

@end

@implementation CheckinInteractor

- (void)closeCurrentWorkDay {
    //TODO: implement
}

- (void)listBinnaclesWithFinishBlock:(void(^)(NSArray *objects,NSError *error))finishBlock {
    [self.checkinDataManager listObjectForClass:Binnacle.class finishBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.binnacles = objects;
        }
        finishBlock(objects, error);
    }];
}

- (void)createBinnacleWithfinishBlock:(void(^)(NSError *error))finishBlock {
    Binnacle *lastBinnacle = self.binnacles.lastObject;
    Binnacle *newBinnacle;
    
    if (lastBinnacle.type == BinnacleTypeInput) {
        newBinnacle = [[Binnacle alloc] initWithtype:BinnacleTypeOutput date:[NSDate date]];
    } else {
        newBinnacle = [[Binnacle alloc] initWithtype:BinnacleTypeInput date:[NSDate date]];
    }
    
    [self.checkinDataManager saveObject:newBinnacle finishBlock:^(NSError *error) {
        finishBlock(error);
    }];
}

- (void)deleteObject:(id<PersistableObjectProtocol>)object
         finishBlock:(void(^)(NSError *error))finishBlock {
    [self.checkinDataManager deleteObject:object finishBlock:finishBlock];
}

- (void)updateObject:(id<PersistableObjectProtocol>)object
         finishBlock:(void(^)(NSError *error))finishBlock {
    [self.checkinDataManager updateObject:object finishBlock:finishBlock];
}

@end
