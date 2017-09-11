//
//  tacoParticle.h
//  Taco Tapper
//
//  Created by Michael Ott on 10/23/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tacoParticle : UIView

@property (nonatomic, strong) UIImageView *tacoImage;
@property (nonatomic) int speedX;
@property (nonatomic) double speedY;
@property (nonatomic) int width;
@property (nonatomic) int height;
@property (nonatomic) double angle;

-(void)display;
@end
