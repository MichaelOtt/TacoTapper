//
//  StatisticsViewController.h
//  Taco Tapper
//
//  Created by Michael Ott on 11/2/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatisticsViewController : UIViewController

@property (strong, nonatomic) NSTimer *automationDisplay;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *sessionLabel;
@property (strong, nonatomic) IBOutlet UILabel *clicksLabel;
@property (strong, nonatomic) IBOutlet UILabel *tappedTacosLabel;
@property (strong, nonatomic) IBOutlet UILabel *automatedTacosLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalTacosLabel;
@property (strong, nonatomic) IBOutlet UILabel *allTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *allClicksLabel;
@property (strong, nonatomic) IBOutlet UILabel *allTappedTacosLabel;
@property (strong, nonatomic) IBOutlet UILabel *allAutomatedTacosLabel;
@property (strong, nonatomic) IBOutlet UILabel *allTotalTacosLabel;

@end
