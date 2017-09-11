//
//  UpgradeMenu.m
//  Taco Tapper
//
//  Created by Michael Ott on 10/25/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import "UpgradeMenu.h"
#import "DataController.h"

@implementation UpgradeMenu

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)initialize:(int)index:(UIColor*)buttonColor:(UIColor*)backgroundColor:(NSString*)name:(NSString*)description:(int)numOwned:(double)costIncrease:(double)originalCost
{
    myIndex = index;
    myButtonColor = buttonColor;
    myName = name;
    myDescription = description;
    myNumOwned = numOwned;
    myCostIncrease = costIncrease;
    //myIncrease = increase;
    myOriginalCost = originalCost;
    myCost = myOriginalCost*pow(myCostIncrease,myNumOwned);
    myCost = floor(myCost);
    
    myBackgroundColor = backgroundColor;
    
    //[self createMenu];
}
-(void)createMenu
{
    //[self setBackgroundColor:myBackgroundColor];
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"upgradeBorder.png"]];
    backgroundView.frame = CGRectMake(-20,0,319,235);
    [self addSubview:backgroundView];
    [self sendSubviewToBack:backgroundView];
    
    purchaseButton = [[UIButton alloc] initWithFrame:CGRectMake(45,45,190,30)];
    //[purchaseButton setBackgroundColor:myButtonColor];
    [purchaseButton setBackgroundImage:[UIImage imageNamed:@"button.png"]
                        forState:UIControlStateNormal];
    [purchaseButton setTitleColor:[UIColor blackColor]forState:(UIControlStateNormal)];
    [purchaseButton setTitle:myName forState:(UIControlStateNormal)];
    purchaseButton.showsTouchWhenHighlighted = true;
    [purchaseButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:purchaseButton];
    
    myDescriptionLabel = [[UILabel alloc]init];
    myDescriptionLabel.text = myDescription;
    myDescriptionLabel.frame = CGRectMake(15,80,250,42);
    myDescriptionLabel.numberOfLines = 0;
    myDescriptionLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:myDescriptionLabel];
    
    /*myIncreaseLabel = [[UILabel alloc]init];
    myIncreaseLabel.text = [NSString stringWithFormat:@"Increase - (+%g)", myIncrease];
    myIncreaseLabel.frame = CGRectMake(10,95,250,21);
    [self addSubview:myIncreaseLabel];*/
    
    myCostLabel = [[UILabel alloc]init];
    myCostLabel.text = [NSString stringWithFormat:@"Cost - %g", myCost];
    myCostLabel.frame = CGRectMake(15,153,250,21);
    myCostLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:myCostLabel];
    
    myNumOwnedLabel = [[UILabel alloc]init];
    myNumOwnedLabel.text = [NSString stringWithFormat:@"Owned - %d", myNumOwned];
    myNumOwnedLabel.frame = CGRectMake(15,176,250,21);
    myNumOwnedLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:myNumOwnedLabel];
    
    UIFont *tacoFont = [UIFont fontWithName:@"TacoModern" size:20];
    
    [self setValue:tacoFont forKeyPath:@"purchaseButton.font"];
    //[self setValue:tacoFont forKeyPath:@"myIncreaseLabel.font"];
    [self setValue:tacoFont forKeyPath:@"myCostLabel.font"];
    [self setValue:tacoFont forKeyPath:@"myNumOwnedLabel.font"];
    
    tacoFont = [UIFont fontWithName:@"TacoModern" size:15];
    [self setValue:tacoFont forKeyPath:@"myDescriptionLabel.font"];
    
}
-(void)buttonClicked
{
    /*if ([DataController getTacoNum] >= myCost)
    {
        [DataController setTacoNum:[DataController getTacoNum] - myCost];
        myNumOwned++;
        [DataController setAmountOwnedArray:myIndex:myNumOwned];
        myCost = myOriginalCost*pow(myCostIncrease,myNumOwned);
        
        myNumOwnedLabel.text = [NSString stringWithFormat:@"Owned - %d", myNumOwned];
        myCostLabel.text = [NSString stringWithFormat:@"Cost - %d", myCost];
        [myTacoBar updateNumber];
    }*/
}
-(void)updateVariables
{
    
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
