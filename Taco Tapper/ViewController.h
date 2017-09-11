//
//  ViewController.h
//  Taco Tapper
//
//  Created by Michael Ott on 10/22/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheTaco.h"
#import "Star.h"
#import "DataController.h"

@interface ViewController : UIViewController
{
    NSMutableArray *tacoArray;
    
}

@property (strong, nonatomic) IBOutlet TheTaco *taco;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSTimer *automationDisplay;
@property (strong, nonatomic) IBOutlet UILabel *tacoCount;
@property (strong, nonatomic) IBOutlet Star *star;
@property (strong, nonatomic) IBOutlet UILabel *tptLabel;
@property (strong, nonatomic) IBOutlet UILabel *tpsLabel;

@property (strong, nonatomic) IBOutlet UILabel *debugLabel;

@property (strong, nonatomic) IBOutlet UIButton *statisticsButton;
@property (strong, nonatomic) IBOutlet UIButton *upgradesButton;
@property (strong, nonatomic) IBOutlet UIButton *tacoBarButton;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)update;
-(void)automatedClick;


@end
