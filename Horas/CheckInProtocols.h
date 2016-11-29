//
//  CheckInProtocols.h
//  Horas
//
//  Created by Ricardo Maqueda on 16/9/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CheckinViewProtocol;
@protocol CheckinPresenterProtocol;
@protocol CheckinInteractorProtocol;
@protocol CheckinWireframeProtocol;
@protocol CheckinDataManagerProtocol;
@protocol PersistableObjectProtocol;



// PRESENTER -> VIEW
@protocol CheckinViewProtocol <NSObject>

@property (nonatomic, strong) id<CheckinPresenterProtocol> checkinPresenter;

- (void)reloadViewWithBinnacles:(NSArray *)binnaclesViewModel;
- (void)titleForCheckinButton:(NSString *)title;
- (void)showAlert:(UIAlertController *)alertController;

@end



// VIEW -> PRESENTER
@protocol CheckinPresenterProtocol <NSObject>

@property (nonatomic, weak) id<CheckinViewProtocol> checkinView;
@property (nonatomic, strong) id<CheckinInteractorProtocol> checkinInteractor;
@property (nonatomic, strong) id<CheckinWireframeProtocol> checkinWireframe;

- (void)viewDidLoad;
- (void)didPressCheckInButton;
- (void)didPressCloseWorkdayButton;

@end



// PRESENTER -> INTERACTOR
@protocol CheckinInteractorProtocol <NSObject>

@property (nonatomic, weak) id<CheckinPresenterProtocol> checkinPresenter;
@property (nonatomic, strong) id<CheckinDataManagerProtocol> checkinDataManager;

- (void)closeCurrentWorkDay;
- (void)listBinnaclesWithFinishBlock:(void(^)(NSArray *objects,NSError *error))finishBlock;
- (void)createBinnacleWithfinishBlock:(void(^)(NSError *error))finishBlock;

@end



@protocol CheckinWireframeProtocol <NSObject>

@property (nonatomic, strong) id<CheckinViewProtocol> checkinView;
@property (nonatomic, strong) id<CheckinPresenterProtocol> checkinPresenter;

- (void)presentCheckinInterfaceFromWindow:(UIWindow *)window;
- (void)presentReportViewController;

@end



@protocol CheckinDataManagerProtocol <NSObject>

- (void)listObjectForClass:(Class <PersistableObjectProtocol>)class
               finishBlock:(void(^)(NSArray *objects,NSError *error))finishBlock;

- (void)saveObject:(id<PersistableObjectProtocol>)object
       finishBlock:(void(^)(NSError *error))finishBlock;

- (void)deleteObject:(id<PersistableObjectProtocol>)object
         finishBlock:(void(^)(NSError *error))finishBlock;

- (void)updateObject:(id<PersistableObjectProtocol>)object
         finishBlock:(void(^)(NSError *error))finishBlock;

@end
