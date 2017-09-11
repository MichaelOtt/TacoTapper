//
//  DataController.h
//  Taco Tapper
//
//  Created by Michael Ott on 10/23/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface DataController : NSObject
{
}

+(void)deAllocateSounds;
+(void)initializeSounds;
+(void)playCrunch;
+(void)playClick;
+(void)playError;

//statistics
+(void)addToTotalTacos:(double)tacos;
+(void)setTotalTacos:(double)tacos;
+(double)getTotalTacos;

+(void)addToSessionTacos:(double)tacos;
+(double)getSessionTacos;

+(void)incrementTaps;
+(int)getTaps;

+(void)incrementAutomatedTacos;
+(void)addToAutomatedTacos:(double)automatedTacos;
+(double)getAutomatedTacos;

+(void)incrementTotalTaps;
+(void)setTotalTaps:(int)clicks;
+(int)getTotalTaps;

+(void)incrementTotalAutomatedTacos;
+(void)setTotalAutomatedTacos:(double)automatedTacos;
+(void)addToTotalAutomatedTacos:(double)automatedTacos;
+(double)getTotalAutomatedTacos;

+(void)incrementTappedTacos;
+(double)getTappedTacos;

+(void)incrementTotalTappedTacos;
+(void)setTotalTappedTacos:(double)tappedTacos;
+(double)getTotalTappedTacos;

//end statistics

//other
+(void)startClock;
+(int)getAmountOwnedArray:(int)index;
+(void)setAmountOwnedArray:(int)index:(int)imput;
+(void)setFullAmountOwnedArray:(NSMutableArray*)array;
+(NSMutableArray*)getFullAmountOwnedArray;
+(int)getAmountOwnedArray2:(int)index;
+(void)setAmountOwnedArray2:(int)index:(int)imput;
+(void)setFullAmountOwnedArray2:(NSMutableArray*)array;
+(NSMutableArray*)getFullAmountOwnedArray2;
+(double)getTacoNum;
+(void)setTacoNum:(double)imput;
+(double)getTacoIncrease;
+(void)setTacoIncrease:(double)imput;
+(int)getTOPPING_NUM;
+(int)getAUTOMATED_NUM;
+(double)getClicksPerSecond;
+(void)setClicksPerSecond:(double)imput;

+(void)automatedClick;
+(void)regularClick;

//end other
@end
