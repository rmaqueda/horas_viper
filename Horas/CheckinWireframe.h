//
//  CheckinWireframe.h
//  Horas
//
//  Created by Ricardo Maqueda on 16/9/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckInProtocols.h"

@interface CheckinWireframe : NSObject <CheckinWireframeProtocol>

@property (nonatomic, strong) id<CheckinViewProtocol> checkinView;
@property (nonatomic, strong) id<CheckinPresenterProtocol> checkinPresenter;

@end
