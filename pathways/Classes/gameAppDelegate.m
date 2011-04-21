//
//  gameAppDelegate.m
//  game
//
//  Created by Berkeley Game Lab on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "gameAppDelegate.h"
#import "startScreenViewController.h"

@implementation gameAppDelegate

@synthesize window;
@synthesize startViewController, aLevelViewController, aScoreViewController;

@synthesize levelData, currentScore;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	application.statusBarOrientation = UIInterfaceOrientationLandscapeRight;
	//startScreenViewController *aViewController = [[startScreenViewController alloc] initWithNibName:@"startScreenViewController" bundle:[NSBundle mainBundle]];
	//self.startViewController = aViewController;
	//[aViewController release];
	
	
    // Override point for customization after application launch.
	[self showMainScreen];
	//UIView *startScreenView = [startViewController view];
	//[window addSubview:startScreenView];
    //[window makeKeyAndVisible];
    
    return YES;
}

- (void) showMainScreen{
	NSLog(@"showing main screen");
	startScreenViewController *aViewController = [[startScreenViewController alloc] initWithNibName:@"startScreenViewController" bundle:[NSBundle mainBundle]];
	self.startViewController = aViewController;
	[aViewController release];	
	UIView *startScreenView = [startViewController view];
	[window addSubview:startScreenView];
    [window makeKeyAndVisible];	
}

- (void) switchLevel{
	NSLog(@"switching to level data: %@", levelData);
	LevelViewController *aViewController = [[LevelViewController alloc] initWithNibName:@"LevelViewController" bundle:[NSBundle mainBundle] withLevelData:levelData withScoreObject:currentScore];
	self.aLevelViewController = aViewController;
	[aViewController release];
	UIView *Level1View = [aLevelViewController view];
	[window addSubview:Level1View];
	
}

/*
- (void) makeLevel1WithLevelData:(NSString *)levelData withScoreObject:(scoreObject *)score{
	LevelViewController *aViewController = [[LevelViewController alloc] initWithNibName:@"LevelViewController" bundle:[NSBundle mainBundle] withLevelData:levelData withScoreObject:score];
	self.aLevelViewController = aViewController;
	//aViewController.containingView = self;
	[aViewController release];
	UIView *Level1View = [aLevelViewController view];
	[window addSubview:Level1View];
}

- (void) switchToLevel2{
	scoreObject *playerScore = [[scoreObject alloc] initWithPlayer:@"Melissa"];
	[self makeLevel2WithLevelData:@"level_02_data" withScoreObject:playerScore];
}
- (void) makeLevel2WithLevelData:(NSString *)levelData withScoreObject:(scoreObject *)score{
	LevelViewController *aViewController = [[LevelViewController alloc] initWithNibName:@"LevelViewController" bundle:[NSBundle mainBundle] withLevelData:levelData withScoreObject:score];
	self.aLevelViewController = aViewController;
	//aViewController.containingView = self;
	[aViewController release];
	UIView *Level1View = [aLevelViewController view];
	[window addSubview:Level1View];
}
*/

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[startViewController release];
    [window release];
    [super dealloc];
}


@end
