//
//  ViewController.m
//  Frustration
//
//  Created by Alexandru Gavrila on 12/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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
	notificationCenter = [NSNotificationCenter defaultCenter];
		
	
	[notificationCenter addObserver:self selector:@selector(timeoutTriggered:) name:kTIMEOUT_TRIGGERED object:nil];
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

-(UIColor *) getColorForRow:(NSInteger) row
{
    float red = (float) (row * 5) / 255.0;
    CGFloat green = 1.0 - red;
    NSLog(@"Red is: %f. Green is %f" ,  red, green);
    return [UIColor colorWithRed:red green:green blue:0.0 alpha:1.0];
}


- (IBAction)updateAction:(id)sender {
    
}

- (IBAction)breakAction:(id)sender {
}

- (IBAction)accelerateAction:(id)sender {
}
@end
