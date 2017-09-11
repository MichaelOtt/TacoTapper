//
//  DataController.m
//  Taco Tapper
//
//  Created by Michael Ott on 10/23/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import "DataController.h"
#import <AudioToolbox/AudioToolbox.h>

//statistics variables
static double myTotalTacos;
static double mySessionTacos = 0;
static double myTappedTacos = 0;
static double myAutomatedTacos = 0;
static double myTotalTappedTacos;
static double myTotalAutomatedTacos;
static int myTaps = 0;
static int myTotalTaps;
//end of statistics variables
static NSTimer *automation;
static double tacoNumber = 0;
static double tacoIncrease = 1;
static double clicksPerSecond = 0;
static NSMutableArray *amountOwnedArray;
static NSMutableArray *amountOwnedArray2;
static const int TOPPING_NUM = 11;
static const int AUTOMATED_NUM = 11;


@implementation DataController
//start statistics


+(void)initializeSounds
{
    //NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/crunch.mp3", [[NSBundle mainBundle] resourcePath]]];
    //AudioServicesCreateSystemSoundID((__bridge CFURLRef) url, &crunchSound);
    
    /*crunchArray = [[NSMutableArray alloc]init];
    clickArray = [[NSMutableArray alloc]init];
    errorArray = [[NSMutableArray alloc]init];*/
    
    /*
    NSURL *url;
    NSError *error;
    
    url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/crunch.mp3", [[NSBundle mainBundle] resourcePath]]];
    AVAudioPlayer *newCrunch = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [newCrunch prepareToPlay];
    
    url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/selected.mp3", [[NSBundle mainBundle] resourcePath]]];
    AVAudioPlayer *newClick = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [newClick prepareToPlay];
    
    url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/error.mp3", [[NSBundle mainBundle] resourcePath]]];
    AVAudioPlayer *newError = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [newError prepareToPlay];*/
    
}
+(void)playCrunch
{
    SystemSoundID newSystemSound;
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/crunch.mp3", [[NSBundle mainBundle] resourcePath]]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) url, &newSystemSound);
    AudioServicesPlaySystemSound(newSystemSound);
    /*NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/crunch.mp3", [[NSBundle mainBundle] resourcePath]]];
	NSError *error;
    AVAudioPlayer *newCrunch = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [newCrunch prepareToPlay];
    [newCrunch play];
    [crunchArray addObject:newCrunch];
    [self deAllocateSounds];*/
}
+(void)playClick
{
    SystemSoundID newSystemSound;
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/selected.mp3", [[NSBundle mainBundle] resourcePath]]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) url, &newSystemSound);
    AudioServicesPlaySystemSound(newSystemSound);
    /*NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/selected.mp3", [[NSBundle mainBundle] resourcePath]]];
	NSError *error;
    AVAudioPlayer *newClick = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [newClick prepareToPlay];
    [newClick play];
    [clickArray addObject:newClick];
    [self deAllocateSounds];*/
}
+(void)playError
{
    SystemSoundID newSystemSound;
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/error.mp3", [[NSBundle mainBundle] resourcePath]]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) url, &newSystemSound);
    AudioServicesPlaySystemSound(newSystemSound);
    /*NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/error.mp3", [[NSBundle mainBundle] resourcePath]]];
	NSError *error;
    AVAudioPlayer *newError = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [newError prepareToPlay];
    [newError play];
    [errorArray addObject:newError];
    [self deAllocateSounds];*/
}
+(void)deAllocateSounds
{

}
+(void)setTotalTacos:(double)tacos
{
    myTotalTacos = tacos;
}
+(void)setTotalTaps:(int)taps
{
    myTotalTaps = taps;
}
+(void)setTotalAutomatedTacos:(double)automatedTacos
{
    myTotalAutomatedTacos = automatedTacos;
}
+(void)setTotalTappedTacos:(double)tappedTacos
{
    myTotalTappedTacos = tappedTacos;
}

+(void)addToTotalTacos:(double)tacos
{
    myTotalTacos += tacos;
}
+(double)getTotalTacos
{
    return floor(myTotalTacos);
}
+(void)addToSessionTacos:(double)tacos
{
    mySessionTacos += tacos;
}
+(double)getSessionTacos
{
    return floor(mySessionTacos);
}

+(void)incrementTaps
{
    myTaps++;
}
+(int)getTaps
{
    return myTaps;
}

+(void)incrementAutomatedTacos
{
    myAutomatedTacos += clicksPerSecond;
}
+(double)getAutomatedTacos
{
    return floor(myAutomatedTacos);
}

+(void)incrementTotalTaps
{
    myTotalTaps++;
}
+(int)getTotalTaps
{
    return myTotalTaps;
}

+(void)incrementTotalAutomatedTacos
{
    myTotalAutomatedTacos += clicksPerSecond;
}
+(double)getTotalAutomatedTacos
{
    return floor(myTotalAutomatedTacos);
}
+(void)incrementTappedTacos
{
    myTappedTacos += tacoIncrease;
}
+(double)getTappedTacos
{
    return floor(myTappedTacos);
}
+(void)addToTotalAutomatedTacos:(double)automatedTacos
{
    myTotalAutomatedTacos += automatedTacos;
}
+(void)addToAutomatedTacos:(double)automatedTacos
{
    myAutomatedTacos += automatedTacos;
}
+(void)incrementTotalTappedTacos
{
    myTotalTappedTacos += tacoIncrease;
}
+(double)getTotalTappedTacos
{
    return floor(myTotalTappedTacos);
}
//end statistics

+(void)automatedClick
{
    [self setTacoNum:tacoNumber+clicksPerSecond];
    [self incrementAutomatedTacos];
    [self incrementTotalAutomatedTacos];
    [self addToTotalTacos:clicksPerSecond];
    [self addToSessionTacos:clicksPerSecond];
}
+(void)regularClick
{
    [self setTacoNum:tacoNumber+tacoIncrease];
    [self incrementTaps];
    [self incrementTotalTaps];
    [self incrementTappedTacos];
    [self incrementTotalTappedTacos];
    [self addToTotalTacos:tacoIncrease];
    [self addToSessionTacos:tacoIncrease];
}
+(double)getClicksPerSecond
{
    return clicksPerSecond;
}
+(void)setClicksPerSecond:(double)imput
{
    clicksPerSecond = imput;
}

+(int)getTOPPING_NUM
{
    return TOPPING_NUM;
}
+(int)getAUTOMATED_NUM
{
    return AUTOMATED_NUM;
}
+(int)getAmountOwnedArray:(int)index
{
    return [[amountOwnedArray objectAtIndex:index] intValue];
}
+(void)setAmountOwnedArray:(int)index:(int)imput
{
    NSNumber *num = [NSNumber numberWithInt:imput];
    [amountOwnedArray replaceObjectAtIndex:index withObject:num];
}
+(void)setFullAmountOwnedArray:(NSMutableArray*)array
{
    amountOwnedArray = array;
}
+(NSMutableArray*)getFullAmountOwnedArray
{
    return amountOwnedArray;
}

+(int)getAmountOwnedArray2:(int)index
{
    return [[amountOwnedArray2 objectAtIndex:index] intValue];
}
+(void)setAmountOwnedArray2:(int)index:(int)imput
{
    NSNumber *num = [NSNumber numberWithInt:imput];
    [amountOwnedArray2 replaceObjectAtIndex:index withObject:num];
}
+(void)setFullAmountOwnedArray2:(NSMutableArray*)array
{
    amountOwnedArray2 = array;
}
+(NSMutableArray*)getFullAmountOwnedArray2
{
    return amountOwnedArray2;
}

+(double)getTacoNum
{
    return floor(tacoNumber);
}
+(void)setTacoNum:(double)imput
{
    tacoNumber = imput;
}
+(double)getTacoIncrease
{
    return tacoIncrease;
}
+(void)setTacoIncrease:(double)imput
{
    tacoIncrease = imput;
}
+(void)startClock
{
    if (![automation isValid])
    {
        automation = [NSTimer scheduledTimerWithTimeInterval:(1) target:self selector:
                    @selector(automatedClick) userInfo:nil repeats:YES];
        //[automation setTolerance:(0.1)];
        [[NSRunLoop mainRunLoop] addTimer:automation forMode:NSRunLoopCommonModes];
        
    }
}
@end
