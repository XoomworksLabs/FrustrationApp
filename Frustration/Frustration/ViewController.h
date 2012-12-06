//
//  ViewController.h
//  Frustration
//
//  Created by Alexandru Gavrila on 12/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) UIColor *cellColor;

@property (nonatomic) CGFloat redPercentage;

- (IBAction)updateAction:(id)sender;
- (IBAction)breakAction:(id)sender;
- (IBAction)accelerateAction:(id)sender;

@end
