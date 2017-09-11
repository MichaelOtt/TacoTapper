//
//  ToppingUpgrade.h
//  Taco Tapper
//
//  Created by Michael Ott on 10/26/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import "UpgradeMenu.h"
#import "TacoBarViewController.h"

@interface ToppingUpgrade : UpgradeMenu
{
    double myIncrease;
    UILabel *myIncreaseLabel;
    TacoBarViewController *myTacoBar;
}
-(void)initialize:
(TacoBarViewController*)tacoBar:
(int)index:
(UIColor*)buttonColor:
(UIColor*)backgroundColor:
(NSString*)name:
(NSString*)description:
(int)numOwned:
(double)costIncrease:
(double)originalCost:
(double)increase;
@end
