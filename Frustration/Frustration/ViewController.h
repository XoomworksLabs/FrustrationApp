//
//  ViewController.h
//  Frustration
//
//  Created by Alexandru Gavrila on 12/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <stdlib.h>
#import <UIKit/UIKit.h>
#import "Randomizer.h"
#import "GraphicsHelper.h"
#import "ColorChooser.h"


@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate> {

	NSTimer *timer;
	Randomizer *randomizer;
	NSInteger currentStep;
	NSInteger stepper;
    CGFloat cellHeight;
    NSInteger currentLoadingCell;
}
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, assign) u_int32_t startInterval;
@property (nonatomic, assign) u_int32_t endInterval;
@property (nonatomic, strong) GraphicsHelper *gHelper;
@property (weak, nonatomic) IBOutlet UIButton *updaterButton;
@property (nonatomic, strong) ColorChooser *colorChooser;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (nonatomic, strong) NSArray *cellsNames;

@property (nonatomic, strong) UIColor *cellColor;

@property (nonatomic) CGFloat redPercentage;

- (IBAction)updateAction:(id)sender;
- (IBAction)resetAction:(id)sender;

@end
