//
//  gameAppDelegate.m
//  game
//
//  Created by Berkeley Game Lab on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "gameAppDelegate.h"
#import "startScreenViewController.h"
#import "highScoreViewController.h"

@implementation gameAppDelegate

@synthesize window;
@synthesize gameState;
@synthesize startViewController, aLevelViewController, aScoreViewController, aHighScoreViewController;
@synthesize navigationController;
@synthesize levelData, currentScore;

#pragma mark -
#pragma mark Application lifecycle

-(void) applicationDidFinishLaunching:(UIApplication *)application
{
	//application.statusBarOrientation = UIInterfaceOrientationLandscapeRight;
    // Override point for customization after application launch.
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
	//[self showMainScreen];
	//return YES;
}

- (void) showMainScreen{
	gameState = MAINSCREEN;
	NSLog(@"showing main screen");
	startScreenViewController *aViewController = [[startScreenViewController alloc] initWithNibName:@"startScreenViewController" bundle:[NSBundle mainBundle]];
	self.startViewController = aViewController;
	[aViewController release];	
	UIView *startScreenView = [startViewController view];
	[window addSubview:startScreenView];
    [window makeKeyAndVisible];	
}

- (void) switchLevel{
	gameState = LEVEL;
	NSLog(@"switching to level data: %@", levelData);
	LevelViewController *aViewController = [[LevelViewController alloc] initWithNibName:@"LevelViewController" bundle:[NSBundle mainBundle] withLevelData:levelData withScoreObject:currentScore];
	self.aLevelViewController = aViewController;
	[aViewController release];
	UIView *Level1View = [aLevelViewController view];
	[window addSubview:Level1View];
}

- (void) showPlayerScores{
	gameState = PLAYERSCORES;
	scoreViewController *aViewController = [[scoreViewController alloc] initWithNibName:@"scoreViewController" bundle:[NSBundle mainBundle] withCurrentScore:currentScore];
	self.aScoreViewController = aViewController;
	[aViewController release];
	UIView *ScoreView = [aScoreViewController view];
	[window addSubview:ScoreView];	
}

-(void) showHighScores{
	gameState = HIGHSCORES;
	highScoreViewController *aViewController = [[highScoreViewController alloc] initWithNibName:@"highScoreViewController" bundle:[NSBundle mainBundle]];
	self.aHighScoreViewController = aViewController;
	[aViewController release];
	UIView *HighScoreView = [aHighScoreViewController view];
	[window addSubview:HighScoreView];	
	
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
	if (gameState == LEVEL) {
		[aLevelViewController shiftToCenter];
	}
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
	[navigationController release];
	[startViewController release];
    [window release];
    [super dealloc];
}


@end
