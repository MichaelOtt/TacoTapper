//
//  TacoBarViewController.m
//  Taco Tapper
//
//  Created by Michael Ott on 10/23/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import "TacoBarViewController.h"
//#import "ViewController.h"
#import "ToppingUpgrade.h"

int UPGRADE_NUM = 10;

@interface TacoBarViewController ()



@end

@implementation TacoBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    [self.presentingViewController dismissViewControllerAnimated:YES completion: nil];
    //[self saveData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UPGRADE_NUM = [DataController getTOPPING_NUM];
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
    
    int scrollViewHeight = 110+UPGRADE_NUM*240;
    if ([[UIScreen mainScreen]bounds].size.height != 568)
    {
        scrollViewHeight += 94;
    }
    [self.myScrollView setContentSize:CGSizeMake(320,scrollViewHeight)];
	// Do any additional setup after loading the view.
}
- (IBAction)buttonClicked:(id)sender
{
    [DataController playClick];
}
-(void)setUpUpgrades
{

    NSArray *names = [[NSArray alloc]initWithObjects:
    @"rice",@"beans",@"lettuce",@"salsa",@"cheese",@"sour cream",@"guacamole",@"tomato",@"olives",@"chicken",@"beef", nil];
    
    double increases[] = {0.2,1,5,20,100,500,4000,10000,50000,200000,1000000};
    double originalCosts[] = {50,900,3750,24000,135000,750000,9600000,26000000,210000000,900000000,5000000000};
    
    int offsetX = 20;
    int offsetY = 80;
    if ([[UIScreen mainScreen]bounds].size.height != 568)
    {
        offsetY += 94;
    }
    NSString *description = @"Increases Tacos Gained Per Tap";
    for (int i = 0; i < UPGRADE_NUM; i++)
    {
        int numOwned = [DataController getAmountOwnedArray:i];
        ToppingUpgrade *newTopping = [[ToppingUpgrade alloc]initWithFrame:CGRectMake(offsetX, offsetY + 240*i, 280, 230)];
        [newTopping initialize:self:i:[UIColor yellowColor]:[UIColor redColor] :[names objectAtIndex:i] :description :numOwned :1.1 :originalCosts[i]:increases[i]];
        [self.myScrollView addSubview:newTopping];
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
