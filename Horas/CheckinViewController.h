//
//  CheckinViewController.h
//  Horas
//
//  Created by Ricardo Maqueda on 16/9/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckInProtocols.h"

@interface CheckinViewController : UIViewController <CheckinViewProtocol>

@property (nonatomic, strong) id<CheckinPresenterProtocol> checkinPresenter;

@end
