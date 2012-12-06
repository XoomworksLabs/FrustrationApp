//
//  BuilderViewController.h
//  Frustration
//
//  Created by Mihai Popa on 12/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuilderViewController : UIViewController
{
    CGFloat currentBrickPosition;
    CGFloat currentBrickWidth;
    NSInteger brickNumber;
}
- (IBAction)build:(id)sender;

@end
