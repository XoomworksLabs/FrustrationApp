//
//  ViewController.m
//  Frustration
//
//  Created by Alexandru Gavrila on 12/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#define kTIMEOUT_TRIGGERED				@"TimeoutTriggered"
#define MAX_SCROLL_RANGE				6
#define SCROLL_STEPPER_MINIMUM			1
#define SCROLL_STEPPER_MAXIMUM			15
#define START_POSITION                  0
#define NUMBER_OF_CELLS                 6
#define TOOLBAR_SIZE                    65

@interface ViewController (PrivateCalls)

-(void)timeoutTriggered:(NSTimer*)theTimer;

@end

@implementation ViewController
@synthesize resetButton;
@synthesize updaterButton;

@synthesize tableView, cellColor, redPercentage, colorChooser, gHelper;
@synthesize startInterval, endInterval, cellsNames;


-(void)loadView
{
    [super loadView];
    cellsNames = [NSArray arrayWithObjects:@"Very low energy" , @"Low energy", @"Enough energy", @"Medium energy", @"High energy", @"Very high energy", nil];
    currentStep = 0;
    stepper = 1;
    colorChooser = [[ColorChooser alloc] init];
    currentLoadingCell = NUMBER_OF_CELLS;
    
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
	
    cellHeight = ([[UIScreen mainScreen] bounds].size.height - TOOLBAR_SIZE) / NUMBER_OF_CELLS;
    
	randomizer = [[Randomizer alloc] init];
	self.startInterval = 0;
	self.endInterval = 5;
	
	gHelper = [[GraphicsHelper alloc] init];
}

- (void)viewDidUnload
{
	[self setUpdaterButton:nil];
    [self setResetButton:nil];
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

	return NO;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return NUMBER_OF_CELLS;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        [cell.textLabel setTextAlignment:UITextAlignmentCenter];
    }
    if (NUMBER_OF_CELLS - indexPath.row > 0)
    {
    //[cell.textLabel setText:[NSString stringWithFormat:@"%@", [self.cellsNames objectAtIndex:(NUMBER_OF_CELLS - indexPath.row - 1)]]];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Cell index path row: %d", indexPath.row);
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}
#pragma mark - Timeouts
-(void)timeoutTriggered:(NSTimer*)theTimer {
    
	[timer invalidate];
	currentStep += stepper;
    UITableViewCell *currentCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:(NUMBER_OF_CELLS - currentStep) inSection:0]];
    [currentCell setBackgroundColor:[colorChooser getCleanColorForRow:(NUMBER_OF_CELLS - currentStep)]];
    [self tableView:tableView willDisplayCell:currentCell forRowAtIndexPath:[NSIndexPath indexPathForRow:(NUMBER_OF_CELLS - currentStep) inSection:0] ];
    [gHelper removeBlockingViewAndEnableViews];
    
    if (currentStep >= NUMBER_OF_CELLS)
    {
        [self.updaterButton setHidden:YES];
    }
}

#pragma mark - IBActions

- (IBAction)updateAction:(id)sender {
    
  
	double randomTime = [randomizer randomizeWithInterval];
	NSLog(@"]random Time: %g", randomTime);
	
	timer = [NSTimer scheduledTimerWithTimeInterval:randomTime target:self selector:@selector(timeoutTriggered:) userInfo:nil repeats:NO];
	[gHelper createAndAddBlockingViewToScreen:self.view withMessage:@"Please wait" andDisableViews:[NSArray arrayWithObjects:self.tableView, self.updaterButton, self.resetButton , nil]];

}

- (IBAction)resetAction:(id)sender {

	[randomizer reset];
    if ([self.updaterButton isHidden])
    {
        [self.updaterButton setHidden:NO];
    }
    currentStep = 0;
    [self.tableView reloadData];
}


#pragma mark - Alert view delegate


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{    
    
}

@end
