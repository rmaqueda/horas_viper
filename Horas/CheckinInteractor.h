//
//  CheckinInteractor.h
//  Horas
//
//  Created by Ricardo Maqueda on 16/9/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckInProtocols.h"

@interface CheckinInteractor : NSObject <CheckinInteractorProtocol>

@property (nonatomic, weak) id<CheckinPresenterProtocol> checkinPresenter;
@property (nonatomic, strong) id<CheckinDataManagerProtocol> checkinDataManager;

@end
