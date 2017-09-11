//
//  Star.m
//  Taco Tapper
//
//  Created by Michael Ott on 10/23/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import "Star.h"

@implementation Star

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)initializeDisplay
{
    self.starImage = [[UIImageView alloc] initWithFrame: CGRectMake(0,0,300,300)];
    [self addSubview: self.starImage];
    NSString *fileName = [NSString stringWithFormat:@"Sun_Star.png"];
    self.starImage.image = [UIImage imageNamed: fileName];
}
-(void)spin
{
    angle += 0.1;
    self.starImage.transform = CGAffineTransformMakeRotation(angle);
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
