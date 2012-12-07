//
//  MainViewController.h
//  Frustration
//
//  Created by Mihai Popa on 12/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BButton.h"

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet BButton *offlineButton;
@property (weak, nonatomic) IBOutlet BButton *onlineButton;

@end
