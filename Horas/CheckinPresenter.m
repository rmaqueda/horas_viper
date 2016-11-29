//
//  CheckinPresenter.m
//  Horas
//
//  Created by Ricardo Maqueda on 16/9/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import "CheckinPresenter.h"
#import "Binnacle.h"

@interface CheckinPresenter ()

@property (nonatomic, strong) NSArray *binnacles;
@property (nonatomic, strong) NSArray *binnaclesViewModel;

@end

@implementation CheckinPresenter

- (void)viewDidLoad {
    [self listBinnacles];
}

- (void)didPressCheckInButton {
    [self.checkinInteractor createBinnacleWithfinishBlock:^(NSError *error) {
        if (!error) {
            [self listBinnacles];
        } else {
            [self.checkinView showAlert:[self accessDiskError]];
        }
    }];
}

- (void)didPressCloseWorkdayButton {
    [self.checkinInteractor closeCurrentWorkDay];
}

#pragma mark - Utils

- (void)listBinnacles {
    [self.checkinInteractor listBinnaclesWithFinishBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.binnacles = objects;
            [self.checkinView reloadViewWithBinnacles:self.binnacles];
            [self.checkinView titleForCheckinButton:[self checkinTitleForBinnacle:self.binnacles.lastObject]];
        } else {
            [self.checkinView showAlert:[self accessDiskError]];
        }
    }];
}

#pragma mark - Alerts

- (UIAlertController *)accessDiskError {
    NSString *message = @"Ha habido un error accediendo al disco";
    UIAlertController *accessDiskError = [UIAlertController alertControllerWithTitle:@"Error leyendo historicos"
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK"
                                                 style:UIAlertActionStyleDefault
                                               handler:nil];
    [accessDiskError addAction:ok];
    
    return accessDiskError;
}

#pragma mark - Title For Checkin Button

- (NSString *)checkinTitleForBinnacle:(Binnacle *)binnacle {
    NSString *title;
    switch (binnacle.type) {
        case BinnacleTypeInput:
            title = @"Salida";
            break;
            
        case BinnacleTypeOutput:
            title = @"Entrada";
            break;
    }
    
    return title;
}

@end
