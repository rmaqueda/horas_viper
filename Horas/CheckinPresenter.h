//
//  CheckinPresenter.h
//  Horas
//
//  Created by Ricardo Maqueda on 16/9/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckInProtocols.h"

@interface CheckinPresenter : NSObject <CheckinPresenterProtocol>

@property (nonatomic, weak) id<CheckinViewProtocol> checkinView;
@property (nonatomic, strong) id<CheckinInteractorProtocol> checkinInteractor;
@property (nonatomic, strong) id<CheckinWireframeProtocol> checkinWireframe;

@end
