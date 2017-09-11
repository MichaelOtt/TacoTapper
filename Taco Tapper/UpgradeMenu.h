//
//  UpgradeMenu.h
//  Taco Tapper
//
//  Created by Michael Ott on 10/25/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpgradeMenu : UIView
{
    int myIndex;
    //double myIncrease;
    //double myClicksPerSecond;
    int myNumOwned;
    double myOriginalCost;
    double myCost;
    double myCostIncrease;
    NSString *myDescription;
    NSString *myName;
    IBOutlet UIButton *purchaseButton;
    UIImage *myPicture;
    UIColor *myButtonColor;
    UIColor *myBackgroundColor;
    UILabel *myDescriptionLabel;
    UILabel *myCostLabel;
    UILabel *myNumOwnedLabel;
    //UILabel *myIncreaseLabel;
}
-(void)createMenu;

-(void)initialize:
(int)index:
(UIColor*)buttonColor:
(UIColor*)backgroundColor:
(NSString*)name:
(NSString*)description:
(int)numOwned:
(double)costIncrease:
(double)originalCost;

-(void)buttonClicked;
-(void)updateVariables;

@end
