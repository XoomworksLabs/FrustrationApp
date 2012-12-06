//
//  BuilderViewController.m
//  Frustration
//
//  Created by Mihai Popa on 12/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#define MAX_NUMBER_OF_BRICKS 10
#define FIRST_BRICK_INITIAL_FRAME CGRectMake(100, 0, 0, 0)
#define BRICK_DIFFERENCE 50;
#define BRICK_INDENT(brickNumber) (brickNumber) * (BRICK_DIFERENCE / 2)

#import "BuilderViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation BuilderViewController
-(void)loadView
{
    [super loadView];
    currentBrickWidth = 500;
    currentBrickPosition = 500;
    brickNumber = 0;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (IBAction)build:(id)sender {
    
    UIView *view = [[UIView alloc] init];
    [view setFrame:FIRST_BRICK_INITIAL_FRAME];
    [view setAlpha:0.1];
    
    [self.view addSubview:view];
    [view setBackgroundColor:[UIColor blueColor]];
    
   [UIView animateWithDuration:3.f animations:^{
       [view setAlpha:1.0];
       [view setFrame:CGRectMake(0, currentBrickPosition, currentBrickWidth, 50)];
       //CGAffineTransform rotationTransform = CGAffineTransformIdentity;
       //rotationTransform = CGAffineTransformRotate(rotationTransform, DEGREES_TO_RADIANS(90));
       //view.transform = rotationTransform;
       
   }];
    currentBrickWidth -= 50;
    currentBrickPosition -= 50;
}
@end
