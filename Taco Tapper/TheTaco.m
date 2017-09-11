//
//  TheTaco.m
//  Taco Tapper
//
//  Created by Michael Ott on 10/22/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import "TheTaco.h"

@implementation TheTaco

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)pressed
{
    self.width = 80;
    self.height = 80;
    self.offsetX = 10;
    self.offsetY = 10;
    [self display];
    
}
-(void)unpressed
{
    self.width = 100;
    self.height = 100;
    self.offsetX = 0;
    self.offsetY = 0;
    [self display];
}
- (void)initializeDisplay
{
    
    self.tacoImage = [[UIImageView alloc] initWithFrame: CGRectMake(self.offsetX,self.offsetY,self.width,self.height)];
    [self addSubview: self.tacoImage];
    NSString *fileName = [NSString stringWithFormat:@"tacoFixed.png"];
    self.tacoImage.image = [UIImage imageNamed: fileName];
}
-(void)display
{
    self.tacoImage.frame = CGRectMake(self.offsetX,self.offsetY,self.width,self.height);
    //self.tacoImage = [[UIImageView alloc] initWithFrame: CGRectMake(5+self.offsetX,5+self.offsetY,self.width,self.height)];
    NSString *fileName = [NSString stringWithFormat:@"tacoFixed.png"];
    self.tacoImage.image = [UIImage imageNamed: fileName];

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
