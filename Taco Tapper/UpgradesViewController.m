//
//  UpgradesViewController.m
//  Taco Tapper
//
//  Created by Michael Ott on 10/26/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import "UpgradesViewController.h"
//#import "ViewController.h"
#import "AutomatedUpgrade.h"

int UPGRADE_NUM2 = 10;

@interface UpgradesViewController ()

@end

@implementation UpgradesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)buttonClicked:(id)sender
{
    [DataController playClick];
    
}

-(void)saveData
{
    /*NSNumber *tacoCounter = [NSNumber numberWithDouble:[DataController getTacoNum]];
    NSMutableArray *amountOwnedArray = [DataController getFullAmountOwnedArray];
    NSMutableArray *amountOwnedArray2 = [DataController getFullAmountOwnedArray2];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:tacoCounter forKey:@"tacoCount"];
    [defaults setObject:amountOwnedArray forKey:@"amountOwnedArray"];
    [defaults setObject:amountOwnedArray2 forKey:@"amountOwnedArray2"];
    [defaults synchronize];*/
}
- (IBAction)backButtonClicked:(id)sender
{
    [self.automationDisplay invalidate];
    [self dismissViewControllerAnimated:YES completion: nil];
    [self saveData];
}
- (void)viewDidLoad
{
    UPGRADE_NUM2 = [DataController getAUTOMATED_NUM];
    UIFont *tacoFont = [UIFont fontWithName:@"TacoModern" size:20];
    [self setValue:tacoFont forKeyPath:@"backButton.font"];
    [self setValue:tacoFont forKeyPath:@"tacoCount.font"];
    
    [self setUpUpgrades];
    [self updateNumber];
    self.automationDisplay = [NSTimer scheduledTimerWithTimeInterval:(0.1) target:self selector:
                             @selector(automatedClick) userInfo:nil repeats:YES];
    //[self.automationDisplay setTolerance:(0.01)];
    [[NSRunLoop mainRunLoop] addTimer:self.automationDisplay forMode:NSRunLoopCommonModes];
    [super viewDidLoad];
    [self.myScrollView setScrollEnabled:true];
    
    int scrollViewHeight = 110+UPGRADE_NUM2*240;
    if ([[UIScreen mainScreen]bounds].size.height != 568)
    {
        scrollViewHeight += 94;
    }
    [self.myScrollView setContentSize:CGSizeMake(320,scrollViewHeight)];
	// Do any additional setup after loading the view.
}
-(void)setUpUpgrades
{
    NSArray *names = [[NSArray alloc]initWithObjects:
    @"taco tapper",@"taco hut",@"taco hose",@"taco shipment",@"taco factory",@"taco land",@"taco cartel",@"taco cloner",@"taco planet",@"taco dimension",@"taco god", nil];
    
    double increases[] = {0.1,0.2,1,3,15,30,120,600,3000,60000,150000};
    double originalCosts[] = {150,500,2500,15000,100000,220000,1000000,5500000,40000000,1000000000,3000000000};
    
    int offsetX = 20;
    int offsetY = 80;
    if ([[UIScreen mainScreen]bounds].size.height != 568)
    {
        offsetY += 94;
    }
    NSString *description = @"Generates Tacos Over Time";
    for (int i = 0; i < UPGRADE_NUM2; i++)
    {
        int numOwned = [DataController getAmountOwnedArray2:i];
        AutomatedUpgrade *newUpgrade = [[AutomatedUpgrade alloc]initWithFrame:CGRectMake(offsetX, offsetY + 240*i, 280, 230)];
        [newUpgrade initialize:self:i:[UIColor yellowColor]:[UIColor redColor] :[names objectAtIndex:i] :description :numOwned :1.1 :originalCosts[i]:increases[i]];
        [self.myScrollView addSubview:newUpgrade];
    }
}
-(void)automatedClick
{
    NSString *tacoText = [NSString stringWithFormat:@"%g", [DataController getTacoNum]];
    self.tacoCount.text = tacoText;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)updateNumber
{
    NSString *tacoText = [NSString stringWithFormat:@"%g", [DataController getTacoNum]];
    self.tacoCount.text = tacoText;
    
}

@end
