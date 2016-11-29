//
//  PersistableObjectProtocol.h
//  Horas
//
//  Created by Ricardo Maqueda on 16/9/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersistableObjectProtocol <NSObject>

+ (NSString *)tableName;

@end
