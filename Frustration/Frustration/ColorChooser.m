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
    CGFloat redColorValue;
    CGFloat greenColorValue;
    BOOL shouldChange = NO;
    
    
    int magicColorNumber = row * 5;
    if (magicColorNumber >= 255)
    {
        shouldChange = YES;
        magicColorNumber = magicColorNumber % 255;
    }

    float incrementalColor = (float) (magicColorNumber) / 255.0;
    CGFloat decrementalColor = 1.0 - incrementalColor;
    redColorValue = incrementalColor;
    greenColorValue = decrementalColor;
    if (shouldChange)
    {
        greenColorValue = incrementalColor;
        redColorValue = decrementalColor;
    }
    NSLog(@"Red is: %f. Green is %f" ,  incrementalColor, decrementalColor);
    return [UIColor colorWithRed:redColorValue green:greenColorValue blue:0.0 alpha:1.0];
}

@end
