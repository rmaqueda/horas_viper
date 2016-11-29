//
//  Dependencies.m
//  Horas
//
//  Created by Ricardo Maqueda Martinez on 27/09/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import "Dependencies.h"
#import "CheckinWireframe.h"
#import "CheckInProtocols.h"
#import "CheckinPresenter.h"
#import "CheckinInteractor.h"
#import "CheckinDataManager.h"



@interface Dependencies ()

@property (nonatomic, strong) CheckinWireframe *checkinWireframe;

@end



@implementation Dependencies

- (instancetype)init {
    if ((self = [super init])) {
        [self configureDependencies];
    }

    return self;
}

#pragma mark - Configuration

- (void)configureDependencies {
    //Root Level Class
    CheckinDataManager *checkinDataManager = [[CheckinDataManager alloc] init];

    // Checkin Module
    CheckinPresenter *checkinPresenter = [[CheckinPresenter alloc] init];
    CheckinInteractor *checkinInteractor = [[CheckinInteractor alloc] init];

    self.checkinWireframe = [[CheckinWireframe alloc] init];
    self.checkinWireframe.checkinPresenter = checkinPresenter;

    checkinPresenter.checkinInteractor = checkinInteractor;
    checkinPresenter.checkinWireframe = self.checkinWireframe;

    checkinInteractor.checkinPresenter = checkinPresenter;
    checkinInteractor.checkinDataManager = checkinDataManager;
}

- (void)installRootViewControllerIntoWindow:(UIWindow *)window {
    [self.checkinWireframe presentCheckinInterfaceFromWindow:window];
}

@end
