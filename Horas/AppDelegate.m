//
//  AppDelegate.m
//  Horas
//
//  Created by Ricardo Maqueda on 16/9/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import "AppDelegate.h"
#import "Dependencies.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    Dependencies *dependecies = [[Dependencies alloc] init];
    [dependecies installRootViewControllerIntoWindow:self.window];
    
    return YES;
}

@end
