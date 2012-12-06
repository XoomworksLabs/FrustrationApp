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


@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {

	NSNotificationCenter *notificationCenter;
	NSTimer *timer;
	Randomizer *randomizer;
}
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, assign) u_int32_t startInterval;
@property (nonatomic, assign) u_int32_t endInterval;


@property (nonatomic, strong) UIColor *cellColor;

@property (nonatomic) CGFloat redPercentage;

- (IBAction)updateAction:(id)sender;
- (IBAction)breakAction:(id)sender;
- (IBAction)accelerateAction:(id)sender;

@end
