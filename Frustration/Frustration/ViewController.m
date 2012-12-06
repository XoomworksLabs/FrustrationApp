//
//  ViewController.m
//  Frustration
//
//  Created by Alexandru Gavrila on 12/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#define kTIMEOUT_TRIGGERED				@"TimeoutTriggered"
#define MAX_SCROLL_RANGE				100
#define SCROLL_STEPPER_MINIMUM			1
#define SCROLL_STEPPER_MAXIMUM			15

@interface ViewController (PrivateCalls)
-(void)timeoutTriggered:(NSTimer*)theTimer;

@end

@implementation ViewController
@synthesize incrementerButton;
@synthesize updaterButton;
@synthesize decrementerButton;

@synthesize tableView, cellColor, redPercentage, colorChooser, gHelper;
@synthesize startInterval, endInterval;


-(void)loadView
{
    [super loadView];
    redPercentage = 0;
    colorChooser = [[ColorChooser alloc] init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	//notificationCenter = [NSNotificationCenter defaultCenter];
		
	randomizer = [[Randomizer alloc] init];
	self.startInterval = 0;
	self.endInterval = 5;
	
	gHelper = [[GraphicsHelper alloc] init];
}

- (void)viewDidUnload
{
	[self setUpdaterButton:nil];
	[self setIncrementerButton:nil];
	[self setIncrementerButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return MAX_SCROLL_RANGE;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cellColor = [colorChooser getColorForRow:indexPath.row];
    [cell setBackgroundColor:cellColor];
}

#pragma mark - Timeouts
-(void)timeoutTriggered:(NSTimer*)theTimer {
		
	[timer invalidate];
	NSLog(@"timeoutTriggered: timeout");
	if (currentStep >= MAX_SCROLL_RANGE) 
		currentStep = 0;
	
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:currentStep+=stepper inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];	
	[gHelper removeBlockingViewAndEnableViews];
}


- (IBAction)updateAction:(id)sender {

	double randomTime = [randomizer randomizeWithInterval:self.startInterval and:self.endInterval];
	NSLog(@"]random Time: %g", randomTime);
	
	timer = [NSTimer scheduledTimerWithTimeInterval:randomTime target:self selector:@selector(timeoutTriggered:) userInfo:nil repeats:NO];
	[gHelper createAndAddBlockingViewToScreen:self.view withMessage:@"Please wait" andDisableViews:[NSArray arrayWithObjects:self.tableView, self.incrementerButton, self.decrementerButton, self.updaterButton , nil]];
}

- (IBAction)breakAction:(id)sender {
	
	if (stepper > SCROLL_STEPPER_MINIMUM)
		stepper--;
}

- (IBAction)accelerateAction:(id)sender {

	if (stepper < SCROLL_STEPPER_MAXIMUM)
		stepper++;
}
@end
