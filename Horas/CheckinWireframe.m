//
//  CheckinWireframe.m
//  Horas
//
//  Created by Ricardo Maqueda on 16/9/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import "CheckinWireframe.h"
#import "CheckinViewController.h"
#import "CheckinPresenter.h"

static NSString *CheckinViewControllerIdentifier = @"CheckinViewControllerIdentifier";

@implementation CheckinWireframe

- (void)presentCheckinInterfaceFromWindow:(UIWindow *)window {
    CheckinViewController *checkinViewController = [self listViewControllerFromStoryboard];
    checkinViewController.checkinPresenter = self.checkinPresenter;
    self.checkinPresenter.checkinView = checkinViewController;

    UINavigationController *navigationController = [self navigationControllerFromWindow:window];
    navigationController.viewControllers = @[checkinViewController];
}

- (void)presentReportViewController {
    //TODO: implement
}

- (CheckinViewController *)listViewControllerFromStoryboard {
    UIStoryboard *storyboard = [self mainStoryboard];

    return [storyboard instantiateViewControllerWithIdentifier:CheckinViewControllerIdentifier];
}

- (UIStoryboard *)mainStoryboard {
    return [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
}

- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window {
    UINavigationController *navigationController = (UINavigationController *)[window rootViewController];

    return navigationController;
}

@end
