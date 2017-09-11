//
//  tacoParticle.m
//  Taco Tapper
//
//  Created by Michael Ott on 10/23/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import "tacoParticle.h"

@implementation tacoParticle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)display
{
    if(self.tacoImage == nil)
    {
        self.width = 25;
        self.height = 30;
        self.tacoImage = [[UIImageView alloc] initWithFrame: CGRectMake(0,0,self.width,self.height)];
        [self addSubview: self.tacoImage];
    }
    NSString *fileName = [NSString stringWithFormat:@"tacoBold.png"];
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
