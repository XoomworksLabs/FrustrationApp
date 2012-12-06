//
//  ColorChooser.m
//  Frustration
//
//  Created by Mihai Popa on 12/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ColorChooser.h"

@implementation ColorChooser

-(UIColor *) getColorForRow:(NSInteger) row
{
    int magicColorNumber = row * 5;
    if (magicColorNumber >= 255)
    {
        magicColorNumber = magicColorNumber % 255;
    }

    float red = (float) (magicColorNumber) / 255.0;
    CGFloat green = 1.0 - red;
    NSLog(@"Red is: %f. Green is %f" ,  red, green);
    return [UIColor colorWithRed:red green:green blue:0.0 alpha:1.0];
}

@end
