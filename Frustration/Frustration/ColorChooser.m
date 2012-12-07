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
    
    
    int magicColorNumber = row * 30;
    if (magicColorNumber >= 255)
    {
        shouldChange = YES;
        magicColorNumber = magicColorNumber % 255;
    }

    float incrementalColor = (float) (magicColorNumber) / 255.0;
    CGFloat decrementalColor = 1.0 - incrementalColor;
    
    redColorValue = decrementalColor;
    greenColorValue = incrementalColor;
    
    if (shouldChange)
    {
        greenColorValue = decrementalColor;
        redColorValue = incrementalColor;
    }
    NSLog(@"Red is: %f. Green is %f" ,  incrementalColor, decrementalColor);
    return [UIColor colorWithRed:redColorValue green:greenColorValue blue:0.0 alpha:1.0];
}

-(UIColor *) getCleanColorForRow:(NSInteger ) row
{
    UIColor *color;
    
    switch (row % 6) {
        case 0:
            color = [UIColor redColor];
            break;
        case 1:
            color = [UIColor orangeColor];
            
            break;
        case 2:
            color = [UIColor yellowColor];
            break;
        case 3:
            color = [UIColor greenColor];
            break;
        case 4:
            color = [UIColor blueColor];
            break;
        case 5:
            color = [UIColor purpleColor];
            break;
        default:
            break;
    }
    
    return color;

}



@end
