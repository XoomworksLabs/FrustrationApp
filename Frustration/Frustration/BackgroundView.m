//
//  BackgroundView.m
//  TeaAppTesting
//
//  Created by Mihai Popa on 10/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BackgroundView.h"
#import "CommonUI.h"

@implementation BackgroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *lightColor = [UIColor colorWithRed:0.7 green:0.7 
                                             blue:0.7 alpha:0.4]; 
    UIColor *darkColor = [UIColor colorWithRed:120/255.0 green:120/255.0
                                                 blue:94/255.0 alpha:1.0];
    
    CGRect paperRect = self.bounds;
    
    drawLinearGradient(context, paperRect, lightColor, darkColor);
}


@end
