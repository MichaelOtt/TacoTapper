//
//  AppDelegate.m
//  Taco Tapper
//
//  Created by Michael Ott on 10/22/13.
//  Copyright (c) 2013 Michael Ott. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "DataController.h"

@implementation AppDelegate
/*-(void)invalidateTimers
{
    NSArray *timers = [DataController getClocks];
    for (id timerObject in timers)
	{
        if ([timerObject isValid])
            [timerObject invalidate];
	}
}*/
-(void)loadStuff
{
    [DataController setTacoNum:0];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [DataController setTacoNum:[[defaults objectForKey:@"tacoCount"] doubleValue]];
    [DataController setTotalTaps:[[defaults objectForKey:@"clicks"] intValue]];
    [DataController setTotalTappedTacos:[[defaults objectForKey:@"tappedTacos"] doubleValue]];
    [DataController setTotalAutomatedTacos:[[defaults objectForKey:@"automatedTacos"] doubleValue]];
    [DataController setTotalTacos:[[defaults objectForKey:@"totalTacos"] doubleValue]];
    
    NSMutableArray *amountOwnedArray = [NSMutableArray arrayWithArray:[defaults objectForKey:@"amountOwnedArray"]];
    NSMutableArray *amountOwnedArray2 = [NSMutableArray arrayWithArray:[defaults objectForKey:@"amountOwnedArray2"]];
    if (amountOwnedArray == nil)
    {
        amountOwnedArray = [[NSMutableArray alloc] initWithCapacity:[DataController getTOPPING_NUM]];
    }
    while ([amountOwnedArray count] < [DataController getTOPPING_NUM])
    {
        [amountOwnedArray addObject:[NSNumber numberWithInt:0]];
    }
    if (amountOwnedArray2 == nil)
    {
        amountOwnedArray2 = [[NSMutableArray alloc] initWithCapacity:[DataController getAUTOMATED_NUM]];
    }
    while ([amountOwnedArray2 count] < [DataController getAUTOMATED_NUM])
    {
        [amountOwnedArray2 addObject:[NSNumber numberWithInt:0]];
    }
    double clicksPerSeconds[] = {0.1,0.2,1,3,15,30,120,600,3000,60000,150000};
    double clicksPerSecondTotal = 0;
    for(int i = 0; i < [amountOwnedArray2 count];i++)
    {
        clicksPerSecondTotal += clicksPerSeconds[i]*[[amountOwnedArray2 objectAtIndex:i] intValue];
    }
    [DataController setClicksPerSecond:clicksPerSecondTotal];
    [DataController setFullAmountOwnedArray2:amountOwnedArray2];
    
    double increases[] = {0.2,1,5,20,100,500,4000,10000,50000,200000,1000000};
    double increaseAmount = 1;
    for(int i = 0; i < [amountOwnedArray count];i++)
    {
        increaseAmount += increases[i]*[[amountOwnedArray objectAtIndex:i] intValue];
    }
    
    [DataController setTacoIncrease:increaseAmount];
    [DataController setFullAmountOwnedArray:amountOwnedArray];
    
    NSDate *start = [defaults objectForKey:@"time"];
    NSTimeInterval timeInterval = [start timeIntervalSinceNow];
    timeInterval = -timeInterval;
    [DataController setTacoNum:[DataController getTacoNum]+floor(timeInterval)*[DataController getClicksPerSecond]];
    [DataController addToTotalAutomatedTacos:floor(timeInterval)*[DataController getClicksPerSecond]];
    [DataController addToTotalTacos:floor(timeInterval)*[DataController getClicksPerSecond]];
    [DataController startClock];
    //[DataController setHasLoaded:true];

}
-(void)saveStuff
{
    NSNumber *tacoCounter = [NSNumber numberWithDouble:[DataController getTacoNum]];
    NSNumber *clicks = [NSNumber numberWithDouble:[DataController getTotalTaps]];
    NSNumber *tappedTacos = [NSNumber numberWithDouble:[DataController getTotalTappedTacos]];
    NSNumber *totalTacos = [NSNumber numberWithDouble:[DataController getTotalTacos]];
    NSNumber *automatedTacos = [NSNumber numberWithDouble:[DataController getTotalAutomatedTacos]];
    NSMutableArray *amountOwnedArray = [DataController getFullAmountOwnedArray];
    NSMutableArray *amountOwnedArray2 = [DataController getFullAmountOwnedArray2];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:tacoCounter forKey:@"tacoCount"];
    [defaults setObject:clicks forKey:@"clicks"];
    [defaults setObject:tappedTacos forKey:@"tappedTacos"];
    [defaults setObject:totalTacos forKey:@"totalTacos"];
    [defaults setObject:automatedTacos forKey:@"automatedTacos"];
    [defaults setObject:amountOwnedArray forKey:@"amountOwnedArray"];
    [defaults setObject:amountOwnedArray2 forKey:@"amountOwnedArray2"];
    
    NSDate *start = [NSDate date];
    [defaults setObject:start forKey:@"time"];
    [defaults synchronize];
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self loadStuff];
    [DataController initializeSounds];
        // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self saveStuff];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDate *start = [defaults objectForKey:@"time"];
    NSTimeInterval timeInterval = [start timeIntervalSinceNow];
    timeInterval = -timeInterval;
    [DataController setTacoNum:[DataController getTacoNum]+floor(timeInterval)*[DataController getClicksPerSecond]];
    [DataController addToAutomatedTacos:floor(timeInterval)*[DataController getClicksPerSecond]];
    [DataController addToSessionTacos:floor(timeInterval)*[DataController getClicksPerSecond]];
    [DataController addToTotalAutomatedTacos:floor(timeInterval)*[DataController getClicksPerSecond]];
    [DataController addToTotalTacos:floor(timeInterval)*[DataController getClicksPerSecond]];
    
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
