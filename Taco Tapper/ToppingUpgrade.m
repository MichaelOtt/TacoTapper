//
//  ToppingUpgrade.m
//  Taco Tapper
//
//  Created by Michael Ott on 10/26/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import "ToppingUpgrade.h"
#import "DataController.h"
//#import "TacoBarViewController.h"

@implementation ToppingUpgrade

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)initialize:(TacoBarViewController*)tacoBar:(int)index:(UIColor*)buttonColor:(UIColor*)backgroundColor:(NSString*)name:(NSString*)description:(int)numOwned:(double)costIncrease:(double)originalCost:(double)increase
{
    [super initialize:index :buttonColor :backgroundColor :name :description :numOwned :costIncrease :originalCost];
    myTacoBar = tacoBar;
    myIncrease = increase;
    [self createMenu];
    
}
-(void)createMenu
{
    [super createMenu];
    myIncreaseLabel = [[UILabel alloc]init];
    myIncreaseLabel.text = [NSString stringWithFormat:@"Increase - (+%g)", myIncrease];
    myIncreaseLabel.frame = CGRectMake(15,130,250,21);
    myIncreaseLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:myIncreaseLabel];
    
    UIFont *tacoFont = [UIFont fontWithName:@"TacoModern" size:20];
    [self setValue:tacoFont forKeyPath:@"myIncreaseLabel.font"];
}
-(void)buttonClicked
{
    if ([DataController getTacoNum] >= myCost)
    {
        [DataController playClick];
        [DataController setTacoNum:[DataController getTacoNum] - myCost];
        myNumOwned++;
        [DataController setAmountOwnedArray:myIndex:myNumOwned];
        [DataController setTacoIncrease:[DataController getTacoIncrease]+myIncrease];
        myCost = myOriginalCost*pow(myCostIncrease,myNumOwned);
        myCost = floor(myCost);
        
        myNumOwnedLabel.text = [NSString stringWithFormat:@"Owned - %d", myNumOwned];
        myCostLabel.text = [NSString stringWithFormat:@"Cost - %g", myCost];
        [myTacoBar updateNumber];
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
