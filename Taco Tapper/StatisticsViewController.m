//
//  StatisticsViewController.m
//  Taco Tapper
//
//  Created by Michael Ott on 11/2/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import "StatisticsViewController.h"
#import "DataController.h"
@interface StatisticsViewController ()

@end

@implementation StatisticsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)backButtonPressed:(id)sender
{
    [self.automationDisplay invalidate];
}

- (void)viewDidLoad
{
    [self fontsForEverything];
    self.automationDisplay = [NSTimer scheduledTimerWithTimeInterval:(0.1) target:self selector:
                              @selector(update) userInfo:nil repeats:YES];
    //[self.automationDisplay setTolerance:(0.01)];
    [[NSRunLoop mainRunLoop] addTimer:self.automationDisplay forMode:NSRunLoopCommonModes];
    [self update];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (IBAction)buttonClicked:(id)sender
{
    [DataController playClick];
    [self dismissViewControllerAnimated:YES completion: nil];
}
-(void)fontsForEverything
{
    UIFont *tacoFont = [UIFont fontWithName:@"TacoModern" size:32];
    [self setValue:tacoFont forKeyPath:@"titleLabel.font"];
    
    tacoFont = [UIFont fontWithName:@"TacoModern" size:20];
    [self setValue:tacoFont forKeyPath:@"backButton.font"];
    [self setValue:tacoFont forKeyPath:@"sessionLabel.font"];
    [self setValue:tacoFont forKeyPath:@"allTimeLabel.font"];
    
    tacoFont = [UIFont fontWithName:@"TacoModern" size:13];
    
    [self setValue:tacoFont forKeyPath:@"clicksLabel.font"];
    [self setValue:tacoFont forKeyPath:@"tappedTacosLabel.font"];
    [self setValue:tacoFont forKeyPath:@"automatedTacosLabel.font"];
    [self setValue:tacoFont forKeyPath:@"totalTacosLabel.font"];
    
    [self setValue:tacoFont forKeyPath:@"allClicksLabel.font"];
    [self setValue:tacoFont forKeyPath:@"allTappedTacosLabel.font"];
    [self setValue:tacoFont forKeyPath:@"allAutomatedTacosLabel.font"];
    [self setValue:tacoFont forKeyPath:@"allTotalTacosLabel.font"];
}
-(void)update
{
    NSString *text;
    
    text = [NSString stringWithFormat:@"Taps - %d", [DataController getTaps]];
    self.clicksLabel.text = text;
    
    text = [NSString stringWithFormat:@"Taps - %d", [DataController getTotalTaps]];
    self.allClicksLabel.text = text;
    
    text = [NSString stringWithFormat:@"Tacos From Taps - %g", [DataController getTappedTacos]];
    self.tappedTacosLabel.text = text;
    
    text = [NSString stringWithFormat:@"Tacos From Taps - %g", [DataController getTotalTappedTacos]];
    self.allTappedTacosLabel.text = text;
    
    text = [NSString stringWithFormat:@"Generated Tacos - %g", [DataController getAutomatedTacos]];
    self.automatedTacosLabel.text = text;
    
    text = [NSString stringWithFormat:@"Generated Tacos - %g", [DataController getTotalAutomatedTacos]];
    self.allAutomatedTacosLabel.text = text;
    
    text = [NSString stringWithFormat:@"Total Tacos - %g", [DataController getSessionTacos]];
    self.totalTacosLabel.text = text;
    
    text = [NSString stringWithFormat:@"Total Tacos - %g", [DataController getTotalTacos]];
    self.allTotalTacosLabel.text = text;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
