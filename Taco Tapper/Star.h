//
//  Star.h
//  Taco Tapper
//
//  Created by Michael Ott on 10/23/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Star : UIView
{
    double angle;
}
@property (nonatomic, strong) UIImageView *starImage;

-(void)initializeDisplay;
-(void)spin;
@end
