    //
//  scoreViewController.m
//  Pathways
//
//  Created by Berkeley Game Lab on 1/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "scoreViewController.h"


@implementation scoreViewController

//@synthesize score1Label, score2Label, score3Label, score4Label, score5Label;
@synthesize scoreScrollView;
@synthesize playerLabel;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		//totalScore = newScore;
	}
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSLog(@"%i", totalScore);
	[self loadScores];
	//[self updateScores];
	//[self saveScores];
	[self showScores];
}

-(void)loadScores{
	NSLog(@"loading scores");
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	scoreArray = nil;
	scoreArray = [[NSMutableArray alloc] initWithArray:[defaults objectForKey:@"scores"]];
#ifdef RESET_DEFAULTS
	[scores removeAllObjects];
#endif
	if ([scoreArray count] == 0) {
		//[scoreArray addObject:[NSArray arrayWithObjects:@"0001", [NSNumber numberWithInt:25],nil]];
		
	}
#ifdef RESET_DEFAULTS
	[self saveScores];
#endif
}

/*
-(void)updateScores{
	NSLog(@"updating scores");
	[scoreArray insertObject:[NSArray arrayWithObjects:@"player", [NSNumber numberWithInt:totalScore],nil] atIndex:[scoreArray count]];
}

-(void)saveScores{
	NSLog(@"saving scores");
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:scoreArray forKey:@"scores"];
}
 */
	 
-(void)showScores{
	NSLog(@"displaying scores");
	
	for (int i = 0; i < [scoreArray count]; i++) {
		NSMutableArray *currScoreField = [scoreArray objectAtIndex:i];
		NSString *playerName = [currScoreField objectAtIndex:0];
		NSDate *currScoreDate = [currScoreField objectAtIndex:1];
		int *currLeftScore = (int *)[[currScoreField objectAtIndex:2] intValue];
		int *currRightScore = (int *)[[currScoreField objectAtIndex:3] intValue];
		int *currTotalScore = (int *)[[currScoreField objectAtIndex:4] intValue];
		UIColor *scoreColor;
		
		if(i == 0){
			scoreColor = [UIColor greenColor];
		}else{
			scoreColor = [UIColor whiteColor];
		}
		/*
		UILabel *playerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(56, 140+20*i, 200, 20)];
		playerNameLabel.text = [NSString stringWithFormat:@"%@", playerName];
		playerNameLabel.backgroundColor = [UIColor clearColor];
		playerNameLabel.textColor = scoreColor;
		playerNameLabel.textAlignment = UITextAlignmentLeft;		
		*/
		playerLabel.text = [NSString stringWithFormat:@"%@", playerName];
		
		NSDateFormatter *format = [[NSDateFormatter alloc] init];
		[format setDateFormat:@"MMM dd, yyyy HH:mm"];
		NSString *dateString = [format stringFromDate:currScoreDate];
		NSLog(@"inSCORES: date: %@", dateString);
		
		UILabel *dateAndTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 140+20*i, 200, 20)];
		dateAndTimeLabel.text = [NSString stringWithFormat:@"%@", dateString];
		dateAndTimeLabel.backgroundColor = [UIColor clearColor];
		dateAndTimeLabel.textColor = scoreColor;
		dateAndTimeLabel.textAlignment = UITextAlignmentLeft;
		
		UILabel *leftScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(188, 140+20*i, 130, 20)];
		leftScoreLabel.text = [NSString stringWithFormat:@"%i", currLeftScore];
		leftScoreLabel.backgroundColor = [UIColor clearColor];
		leftScoreLabel.textColor = scoreColor;
		leftScoreLabel.textAlignment = UITextAlignmentCenter;
		
		UILabel *rightScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(326, 140+20*i, 130, 20)];
		rightScoreLabel.text = [NSString stringWithFormat:@"%i", currRightScore];
		rightScoreLabel.backgroundColor = [UIColor clearColor];
		rightScoreLabel.textColor = scoreColor;
		rightScoreLabel.textAlignment = UITextAlignmentCenter;
		
		UILabel *totalScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(482, 140+20*i, 130, 20)];
		totalScoreLabel.text = [NSString stringWithFormat:@"%i", currTotalScore];
		totalScoreLabel.backgroundColor = [UIColor clearColor];
		totalScoreLabel.textColor = scoreColor;
		totalScoreLabel.textAlignment = UITextAlignmentCenter;
		
		//[self.view addSubview:playerNameLabel];
		[self.view addSubview:dateAndTimeLabel];
		[self.view addSubview:leftScoreLabel];
		[self.view addSubview:rightScoreLabel];
		[self.view addSubview:totalScoreLabel];
		
	}
	[self showGraph];

	
}
		 

-(void) showGraph{
	NSLog(@"trying to get image from URL");
	NSString *graphURLString = [NSString stringWithFormat:@"http://chart.apis.google.com/chart?chxl=0:|Jan|Feb|Mar|Jun|Jul|Aug|1:|100|50|0|2:|100|75|50|25|0&chxs=0,00AA00,14,0.5,l,676767&chxt=x,r,y&chs=375x275&cht=lc&chco=FF0000,0000FF&chd=s:DJGPMeGPVPYbekb,3483ghhasdfsdf&chdl=Right+Hand|Left+Hand&chdlp=t&chg=20,25&chls=1.333|4.333&chma=|41,31"];
	graphURLString = [graphURLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; 
	NSURL *graphURL = [NSURL URLWithString:graphURLString];
	//NSURL *graphURL = [NSURL URLWithString:@"http://26.media.tumblr.com/tumblr_ljys5g16DL1qzj2dvo1_500.jpg"];
	NSData *graphData = [NSData dataWithContentsOfURL:graphURL];
	UIImage *graphImage = [UIImage imageWithData:graphData];
	UIImageView *graphImageView = [[UIImageView alloc] initWithImage:graphImage];
	[graphImageView setFrame:CGRectMake(628, 111, 375, 275)];
	[self.view addSubview:graphImageView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


-(IBAction)doneButtonPressed:(UIButton *)doneButton {
	[self.view removeFromSuperview];

}

- (void)dealloc {
    [super dealloc];
}


@end
