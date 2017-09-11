//
//  TacoBarViewController.h
//  Taco Tapper
//
//  Created by Michael Ott on 10/23/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"

@interface TacoBarViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *backButton;

@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (strong, nonatomic) NSTimer *automationDisplay;
@property (strong, nonatomic) IBOutlet UILabel *tacoCount;

-(void)saveData;
-(void)setUpUpgrades;
-(void)updateNumber;
@end
