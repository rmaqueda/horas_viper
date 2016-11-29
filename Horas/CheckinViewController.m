//
//  CheckinViewController.m
//  Horas
//
//  Created by Ricardo Maqueda on 16/9/16.
//  Copyright © 2016 Ricardo Maqueda. All rights reserved.
//

#import "CheckinViewController.h"
#import "Binnacle.h"

//TODO: Extract delegate and Datasource: http://katade.com/clean-collection-view-ios
@interface CheckinViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) NSArray *binnacles;

@end

@interface CheckinViewController ()

@property (nonatomic, weak) IBOutlet UIButton *checkinButton;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation CheckinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.checkinPresenter viewDidLoad];
}

#pragma mark - Checkin Presenter

- (void)reloadViewWithBinnacles:(NSArray *)binnaclesViewModel {
    self.binnacles = binnaclesViewModel;
    [self.tableView reloadData];
}

- (void)titleForCheckinButton:(NSString *)title {
    [self.checkinButton setTitle:title forState:UIControlStateNormal];
}

- (IBAction)didPressCheckinButton:(id)sender {
    [self.checkinPresenter didPressCheckInButton];
}

- (void)showAlert:(UIAlertController *)alertController {
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - TableView Delegate & Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.binnacles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Binnacle *binnacle = self.binnacles[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BinnacleCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"BinnacleCell"];
    }
    
    cell.textLabel.text = binnacle.date.description;
    
    if (binnacle.type == BinnacleTypeInput) {
        cell.backgroundColor = [UIColor greenColor];
    } else {
        cell.backgroundColor = [UIColor redColor];
    }
        
    return cell;
}

@end
