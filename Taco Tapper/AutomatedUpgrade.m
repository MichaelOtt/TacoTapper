//
//  AutomatedUpgrade.m
//  Taco Tapper
//
//  Created by Michael Ott on 10/26/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import "AutomatedUpgrade.h"
#import "DataController.h"
//#import "UpgradesViewController.h"

@implementation AutomatedUpgrade

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)initialize:(UpgradesViewController*)upgrades:(int)index:(UIColor*)buttonColor:(UIColor*)backgroundColor:(NSString*)name:(NSString*)description:(int)numOwned:(double)costIncrease:(double)originalCost:(double)clicksPerSecond
{
    [super initialize:index :buttonColor :backgroundColor :name :description :numOwned :costIncrease :originalCost];
    myUpgrades = upgrades;
    myClicksPerSecond = clicksPerSecond;
    [self createMenu];
    
}
-(void)createMenu
{
    [super createMenu];
    
    myClicksPerSecondLabel = [[UILabel alloc]init];
    myClicksPerSecondLabel.text = [NSString stringWithFormat:@"+%g TPS", myClicksPerSecond];
    myClicksPerSecondLabel.frame = CGRectMake(15,130,250,21);
    myClicksPerSecondLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:myClicksPerSecondLabel];
    
    UIFont *tacoFont = [UIFont fontWithName:@"TacoModern" size:20];
    [self setValue:tacoFont forKeyPath:@"myClicksPerSecondLabel.font"];
}
-(void)buttonClicked
{
    if ([DataController getTacoNum] >= myCost)
    {
        [DataController playClick];
        [DataController setTacoNum:[DataController getTacoNum] - myCost];
        myNumOwned++;
        [DataController setAmountOwnedArray2:myIndex:myNumOwned];
        [DataController setClicksPerSecond:[DataController getClicksPerSecond]+myClicksPerSecond];
        myCost = myOriginalCost*pow(myCostIncrease,myNumOwned);
        myCost = floor(myCost);
        
        myNumOwnedLabel.text = [NSString stringWithFormat:@"Owned - %d", myNumOwned];
        myCostLabel.text = [NSString stringWithFormat:@"Cost - %g", myCost];
        [myUpgrades updateNumber];
    }
    else
    {
        [DataController playError];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
