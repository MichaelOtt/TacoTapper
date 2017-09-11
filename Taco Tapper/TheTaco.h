//
//  TheTaco.h
//  Taco Tapper
//
//  Created by Michael Ott on 10/22/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TheTaco : UIView

@property (nonatomic, strong) UIImageView *tacoImage;

-(void)display;
-(void)initializeDisplay;
-(void)pressed;
-(void)unpressed;
@property(nonatomic) int width;
@property(nonatomic) int height;
@property(nonatomic) int offsetX;
@property(nonatomic) int offsetY;


@end
