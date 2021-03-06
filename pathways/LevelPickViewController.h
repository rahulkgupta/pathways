//
//  LevelPickViewController.h
//  Pathways
//
//  Created by Rahul Kartikeya Gupta on 4/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "gameAppDelegate.h"
#import "LevelViewController.h"
#import "scoreObject.h"
#import "VoronoiLevelViewController.h"

@interface LevelPickViewController : UIViewController {

	scoreObject *score;
	LevelViewController *levelController;
	VoronoiLevelViewController *voronoiController;

}

@property (nonatomic,retain) LevelViewController *levelController;
@property (nonatomic,retain) VoronoiLevelViewController *voronoiController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andPlayerScore:playerScore;

- (IBAction) loadLevel1: (UIButton *) sender;

- (IBAction) loadLevel2: (UIButton *) sender;

- (IBAction) loadLevel3: (UIButton *) sender;

- (IBAction) loadRandomLevel: (UIButton *) sender;



@end
