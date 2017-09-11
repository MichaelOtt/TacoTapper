//
//  AutomatedUpgrade.h
//  Taco Tapper
//
//  Created by Michael Ott on 10/26/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import "UpgradeMenu.h"
#import "UpgradesViewController.h"

@interface AutomatedUpgrade : UpgradeMenu
{
    double myClicksPerSecond;
    UILabel *myClicksPerSecondLabel;
    UpgradesViewController *myUpgrades;
}
-(void)initialize:
(UpgradesViewController*)upgrades:
(int)index:
(UIColor*)buttonColor:
(UIColor*)backgroundColor:
(NSString*)name:
(NSString*)description:
(int)numOwned:
(double)costIncrease:
(double)originalCost:
(double)clicksPerSecond;
@end
