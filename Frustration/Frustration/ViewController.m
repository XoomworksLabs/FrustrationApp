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
-(void)createWebView;
-(void)addSpinner;
-(void)createColorView;

@end

@implementation ViewController
@synthesize resetButton;
@synthesize updaterButton;
@synthesize viewControllerType;

@synthesize tableView, cellColor, redPercentage, colorChooser, gHelper;
@synthesize startInterval, endInterval, cellsNames, cellBlockingView, webView, currentCell, colorView;


-(void)loadView
{
    [super loadView];
    cellsNames = [NSArray arrayWithObjects:@"http://www.google.com" , @"http://www.bing.com", @"http://www.apple.com", @"http://www.parse.com", @"http://www.livescore.com", @"http://www.dell.com", nil];
    currentStep = 0;
    stepper = 1;
    colorChooser = [[ColorChooser alloc] init];
    currentLoadingCell = NUMBER_OF_CELLS;
    reset = NO;
    
    
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
	CGFloat navigationBarSize = self.navigationController.navigationBar.frame.size.height;
    cellHeight = ([[UIScreen mainScreen] bounds].size.height - TOOLBAR_SIZE - navigationBarSize) / NUMBER_OF_CELLS;
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    
	randomizer = [[Randomizer alloc] init];
	self.startInterval = 0;
	self.endInterval = 5;
	
    [self.updaterButton setType:BButtonTypeSuccess];
    [self.resetButton setType:BButtonTypeDanger];
    
	gHelper = [[GraphicsHelper alloc] init];
    cellBlockingView = [[GraphicsHelper alloc] init];
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
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (reset == YES)
    {
        [cell setBackgroundView:nil];
    }
    else
    {
        
    }
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
    currentCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:(NUMBER_OF_CELLS - currentStep) inSection:0]];    
    
    
    if (viewControllerType == ViewControllerType_ONLINE)
    {
        [self createWebView];
        
        [self addSpinner];
        
    }
    else if (viewControllerType == ViewControllerType_OFFLINE)
    {
        [self createColorView];
    }
    
    [self tableView:tableView willDisplayCell:currentCell forRowAtIndexPath:[NSIndexPath indexPathForRow:(NUMBER_OF_CELLS - currentStep) inSection:0] ];
    
    [gHelper removeBlockingViewAndEnableViews];
    
    if (currentStep >= NUMBER_OF_CELLS)
    {
        [self.updaterButton setHidden:YES];
    }
}

#pragma mark - IBActions

- (IBAction)updateAction:(id)sender {
    
    if (reset == YES)
    {
        reset = NO;
    }
	double randomTime = [randomizer randomizeWithInterval];
	NSLog(@"]random Time: %g", randomTime);
	
	timer = [NSTimer scheduledTimerWithTimeInterval:randomTime target:self selector:@selector(timeoutTriggered:) userInfo:nil repeats:NO];
	[gHelper createAndAddBlockingViewToScreen:self.view withMessage:@"Please wait" andDisableViews:[NSArray arrayWithObjects:self.tableView, self.updaterButton, self.resetButton , nil]];
    
}

- (IBAction)resetAction:(id)sender {
    
	[randomizer reset];
    if ([self.updaterButton isHidden] || ![self.updaterButton isEnabled])
    {
        [self.updaterButton setHidden:NO];
        [self.updaterButton setEnabled:YES];
    }
    currentStep = 0;
    reset = YES;
    [self.tableView reloadData];
}


#pragma mark - Alert view delegate
- (void)webViewDidFinishLoad:(UIWebView *)wV
{
    [currentCell setBackgroundView:wV];
    [self.updaterButton setEnabled:YES];
}
-(void)createWebView
{
    webView = [[UIWebView alloc] initWithFrame:currentCell.backgroundView.frame];
    NSString *urlAddress = [cellsNames objectAtIndex:currentStep - 1];
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    [webView setDelegate:self];
    
}
-(void)createColorView
{
    colorView = [[UIView alloc] initWithFrame:currentCell.backgroundView.frame];
    [colorView setBackgroundColor:[colorChooser getColorForRow:currentStep - 1]];
    [currentCell setBackgroundView:colorView];
}
-(void)addSpinner
{
    UIView *view = [[UIView alloc] initWithFrame:currentCell.backgroundView.frame];
    [view setBackgroundColor:[UIColor clearColor]];
    [currentCell setBackgroundView:view];
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(360, 30, 0, 0)];
    [view addSubview:spinner];
    [self.updaterButton setEnabled:NO];
    
    [UIView animateWithDuration:0.15f animations:^{
        CGRect frame = [spinner frame];
        frame.origin.x -= 20;
        frame.size.width += 40;
        frame.origin.y -= 20;
        frame.size.height += 40;
        [spinner setFrame:frame];
        spinner.layer.cornerRadius = 3.0;
        [spinner setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3]];
        [spinner startAnimating];
    }];
}

@end
