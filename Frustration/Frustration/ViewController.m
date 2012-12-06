//
//  ViewController.m
//  Frustration
//
//  Created by Alexandru Gavrila on 12/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#define kTIMEOUT_TRIGGERED				@"TimeoutTriggered"

#import "ViewController.h"

#define kTIMEOUT_TRIGGERED				@"TimeoutTriggered"

@interface ViewController (PrivateCalls)
<<<<<<< HEAD
=======

>>>>>>> d8b47c3ed77f61d68d80edb76c10102ac5cb7e1d
-(void)timeoutTriggered:(NSTimer*)theTimer;
-(UIColor *) getColorForRow:(NSInteger) row;
@end

<<<<<<< HEAD
=======


>>>>>>> d8b47c3ed77f61d68d80edb76c10102ac5cb7e1d
@implementation ViewController

@synthesize tableView, cellColor, redPercentage, startInterval, endInterval;


-(void)loadView
{
    [super loadView];
    redPercentage = 0;
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
}

- (void)viewDidUnload
{
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
    return 100;
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
    cellColor = [self getColorForRow:indexPath.row];
    [cell setBackgroundColor:cellColor];
}

#pragma mark - Timeouts
-(void)timeoutTriggered:(NSTimer*)theTimer {
		
	[timer invalidate];
	NSLog(@"timeoutTriggered: timeout");
}

-(UIColor *) getColorForRow:(NSInteger) row
{
    float red = (float) (row * 10) / 255.0;
    CGFloat green = 1.0 - red;
    NSLog(@"Red is: %f. Green is %f" ,  red, green);
    return [UIColor colorWithRed:red green:green blue:0.0 alpha:1.0];
}


- (IBAction)updateAction:(id)sender {
<<<<<<< HEAD

	double randomTime = [randomizer randomizeWithInterval:self.startInterval and:self.endInterval];
	NSLog(@"]random Time: %g", randomTime);
	
	timer = [NSTimer scheduledTimerWithTimeInterval:randomTime target:self selector:@selector(timeoutTriggered:) userInfo:nil repeats:YES];    
=======
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:rand() % 100 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
>>>>>>> d8b47c3ed77f61d68d80edb76c10102ac5cb7e1d
}

- (IBAction)breakAction:(id)sender {
}

- (IBAction)accelerateAction:(id)sender {
}
@end
