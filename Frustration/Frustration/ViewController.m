//
//  ViewController.m
//  Frustration
//
//  Created by Alexandru Gavrila on 12/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (PrivateCalls)
-(void)timeoutTriggered:(NSTimer*)theTimer;
@end

-(UIColor *) getColorForRow:(NSInteger) row;

@end


#define kTIMEOUT_TRIGGERED				@"TimeoutTriggered"

@implementation ViewController

@synthesize tableView, cellColor, redPercentage;


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

	double randomTime = [randomizer randomizeWithInterval:0 and:10];
	timer = [NSTimer scheduledTimerWithTimeInterval:randomTime target:self selector:@selector(timeoutTriggered:) userInfo:nil repeats:YES];
	
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
    return 10;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    [cell.textLabel setText:@"Simple cell"];
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
    return [UIColor colorWithRed:0.5 green:0.1 blue:0.0 alpha:1.0];
}


- (IBAction)updateAction:(id)sender {
    
}

- (IBAction)breakAction:(id)sender {
}

- (IBAction)accelerateAction:(id)sender {
}
@end
