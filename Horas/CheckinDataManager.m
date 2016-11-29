//
//  CheckinDataManager.m
//  Horas
//
//  Created by Ricardo Maqueda on 16/9/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import "CheckinDataManager.h"
#import "PersistableObjectProtocol.h"

@interface CheckinDataManager ()

@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end


@implementation CheckinDataManager

+ (id)sharedManager {
    static CheckinDataManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (instancetype)init {
    if ((self = [super init])) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    
    return self;
}

- (void)listObjectForClass:(Class<PersistableObjectProtocol>)class
               finishBlock:(void (^)(NSArray *objects, NSError *))finishBlock {
    if (finishBlock) {
        finishBlock([self allBinnaclesForClass:class], nil);
    }
}

- (NSArray *)allBinnaclesForClass:(Class <PersistableObjectProtocol>)class {
    NSData *data = [self.userDefaults objectForKey:[class tableName]];
    
    if (!data) {
        return @[];
    } else {
        return [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
}

- (NSArray *)listObjectForClass:(Class <PersistableObjectProtocol>)class {
    NSMutableArray *binacleMutable = [[self allBinnaclesForClass:class] mutableCopy];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    [binacleMutable sortUsingDescriptors:@[sortDescriptor]];
    
    
    return binacleMutable;
}

- (void)saveObject:(id<PersistableObjectProtocol>)object
       finishBlock:(void(^)(NSError *error))finishBlock
{
    NSMutableArray *objects = [[self allBinnaclesForClass:object.class] mutableCopy];
    [objects addObject:object];
    [self.userDefaults setObject:[NSKeyedArchiver archivedDataWithRootObject:objects] forKey:[object.class tableName]];
    
    if (finishBlock) finishBlock(nil);
}

- (void)deleteObject:(id<PersistableObjectProtocol>)object
         finishBlock:(void(^)(NSError *error))finishBlock
{
    NSMutableArray *objects = [[self allBinnaclesForClass:object.class] mutableCopy];
    
    for (id<PersistableObjectProtocol> oneObject in objects) {
        if ([oneObject isEqual:object]) {
            [objects removeObject:oneObject];
            break;
        }
    }
    
    [self.userDefaults setObject:[NSKeyedArchiver archivedDataWithRootObject:objects] forKey:[object.class tableName]];
    
    if (finishBlock) finishBlock(nil);
}

- (void)updateObject:(id<PersistableObjectProtocol>)object
         finishBlock:(void (^)(NSError *))finishBlock
{
    NSMutableArray *objects = [[self allBinnaclesForClass:object.class] mutableCopy];
    
    for (int i = 0; i < objects.count; i++) {
        id<PersistableObjectProtocol> oneObject = objects[i];
        if ([oneObject isEqual:object]) {
            objects[i] = object;
            
            break;
        }
    }
    
    [self.userDefaults setObject:[NSKeyedArchiver archivedDataWithRootObject:objects] forKey:[object.class tableName]];
}

@end
