//
//  ViewController.h
//  Frustration
//
//  Created by Alexandru Gavrila on 12/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Randomizer.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {

	NSNotificationCenter *notificationCenter;
	NSTimer *timer;
	Randomizer *randomizer;
}
@property (nonatomic, strong) IBOutlet UITableView *tableView;


@end
