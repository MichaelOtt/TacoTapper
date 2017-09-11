//
//  ViewController.m
//  Taco Tapper
//
//  Created by Michael Ott on 10/22/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import "ViewController.h"
#import "tacoParticle.h"
#import "DataController.h"
#import "TacoBarViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{

    UIFont *tacoFont = [UIFont fontWithName:@"TacoModern" size:20];
    [self setValue:tacoFont forKeyPath:@"statisticsButton.font"];
    [self setValue:tacoFont forKeyPath:@"tacoBarButton.font"];
    [self setValue:tacoFont forKeyPath:@"upgradesButton.font"];
    [self setValue:tacoFont forKeyPath:@"tpsLabel.font"];
    [self setValue:tacoFont forKeyPath:@"tptLabel.font"];
    [self setValue:tacoFont forKeyPath:@"tacoCount.font"];
    
    tacoArray = [[NSMutableArray alloc] init];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:(0.03) target:self selector:
                  @selector(update) userInfo:nil repeats:YES];
    //[self.timer setTolerance:(0.003)];
    self.automationDisplay = [NSTimer scheduledTimerWithTimeInterval:(0.1) target:self selector:
                  @selector(automatedClick) userInfo:nil repeats:YES];
    //[self.automationDisplay setTolerance:(0.01)];
    [[NSRunLoop mainRunLoop] addTimer:self.automationDisplay forMode:NSRunLoopCommonModes];
    
    [super viewDidLoad];
    self.taco.width = 100;
    self.taco.height = 100;
    self.taco.offsetX = 0;
    self.taco.offsetY = 0;

    NSString *tptLabelText = [NSString stringWithFormat:@"TPT: %g", [DataController getTacoIncrease]];
    self.tptLabel.text = tptLabelText;
    
    NSString *tpsLabelText = [NSString stringWithFormat:@"TPS: %g", [DataController getClicksPerSecond]];
    self.tpsLabel.text = tpsLabelText;
    
    NSString *tacoText = [NSString stringWithFormat:@"%g", [DataController getTacoNum]];
    self.tacoCount.text = tacoText;
    [self.taco initializeDisplay];
    [self.star initializeDisplay];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)automatedClick
{
    NSString *tacoText = [NSString stringWithFormat:@"%g", [DataController getTacoNum]];
    self.tacoCount.text = tacoText;
}
- (IBAction)tacoBarClicked:(id)sender
{
    [self.automationDisplay invalidate];
    [self saveData];
}
- (IBAction)upgradesButtonClicked:(id)sender
{
    [self.automationDisplay invalidate];
    
    [self saveData];
}
- (IBAction)statisticsButtonClicked:(id)sender
{
    [self.automationDisplay invalidate];
    
    [self saveData];
}
-(void)saveData
{
    /*NSNumber *tacoCounter = [NSNumber numberWithDouble:[DataController getTacoNum]];
    NSMutableArray *amountOwnedArray = [DataController getFullAmountOwnedArray];
    NSMutableArray *amountOwnedArray2 = [DataController getFullAmountOwnedArray2];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:tacoCounter forKey:@"tacoCount"];
    [defaults setObject:amountOwnedArray forKey:@"amountOwnedArray"];
    [defaults setObject:amountOwnedArray2 forKey:@"amountOwnedArray2"];
    [defaults synchronize];*/
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *aTouch = [touches anyObject];
    CGPoint touchPosition = [aTouch locationInView:self.view];
    int tacoCornerX = self.taco.center.x - self.taco.width/2;
    int tacoCornerY = self.taco.center.y - self.taco.height/2;
    if ([[UIScreen mainScreen]bounds].size.height != 568)
    {
        tacoCornerY += 44;
    }
    
    if (touchPosition.x >= tacoCornerX && touchPosition.x <= tacoCornerX + self.taco.width &&
        touchPosition.y >= tacoCornerY && touchPosition.y <= tacoCornerY + self.taco.height)
    {
        [self.taco pressed];
        [DataController regularClick];
        NSString *tacoText = [NSString stringWithFormat:@"%g", [DataController getTacoNum]];
        self.tacoCount.text = tacoText;
        [DataController playCrunch];
        for (int i = 0; i < 2; i++)
        {
            tacoParticle *instance = [[tacoParticle alloc] init];
            [instance display];
            int startX = arc4random()%self.taco.width + tacoCornerX;
            int startY = arc4random()%(self.taco.height/2) + tacoCornerY + self.taco.height/4;
            instance.center = CGPointMake(startX-instance.width/2,startY-instance.height/2);
            instance.speedX = arc4random()%11-5;
            instance.speedY = -5;
            instance.angle = arc4random()%360;
            [tacoArray addObject:instance];
            [self.view addSubview: instance];
        }
    }
    
}
- (IBAction)buttonClicked:(id)sender
{
    [DataController playClick];
}
-(void)update
{
    for (int i = 0; i < (int)tacoArray.count; i++)
    {
        tacoParticle *d = [tacoArray objectAtIndex:i];
        d.center = CGPointMake(d.center.x+d.speedX, d.center.y+d.speedY);
        d.angle += 0.5;
        d.tacoImage.transform = CGAffineTransformMakeRotation(d.angle);
        if (d.center.y >= 568+d.height)
        {
            [d removeFromSuperview];
            [tacoArray removeObjectAtIndex:i];
            i--;
        }
        d.speedY+=0.5;
    }
    [self.star spin];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //UITouch *aTouch = [touches anyObject];
    //CGPoint touchPosition = [aTouch locationInView:self.view];
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.taco unpressed];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
