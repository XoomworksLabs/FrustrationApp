//
//  Randomizer.m
//  Frustration
//
//  Created by Alexandru Gavrila on 12/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Randomizer.h"

@implementation Randomizer

-(double)randomizeWithInterval:(u_int32_t) start and:(u_int32_t) end {
	
	double result = 0.0;
	
	result = (arc4random() % end) + start;
	return result;
}

@end
