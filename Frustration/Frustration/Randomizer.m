//
//  Randomizer.m
//  Frustration
//
//  Created by Alexandru Gavrila on 12/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Randomizer.h"

@interface Randomizer(PrivateCalls)
-(double)subRandomize:(int *)interval;
-(BOOL)checkIndexSpaceByIndex:(int )index;
-(BOOL)allTaken;
@end


@implementation Randomizer

#pragma mark - object lifecycle
-(id)init {
	
	self = [super init];
	
	if (self) {
/*		
		timeIntervalA[0] = 50;		timeIntervalA[1] = 150;
		timeIntervalB[0] = 150;		timeIntervalB[1] = 300;
		timeIntervalC[0] = 300;		timeIntervalC[1] = 600;
		timeIntervalD[0] = 600;		timeIntervalD[1] = 1000;
		timeIntervalE[0] = 1000;	timeIntervalE[1] = 2000;
		timeIntervalF[0] = 5000;	timeIntervalF[1] = 5000;	
*/
		
		timeIntervalA[0] = 50;		timeIntervalA[1] = 150;
		timeIntervalB[0] = 500;		timeIntervalB[1] = 700;
		timeIntervalC[0] = 1000;	timeIntervalC[1] = 1200;
		timeIntervalD[0] = 5000;	timeIntervalD[1] = 5000;
		timeIntervalE[0] = 7000;	timeIntervalE[1] = 7000;
		timeIntervalF[0] = 10000;	timeIntervalF[1] = 10000;	
		
		onceLong = NO;

		maxIndexSpace = MAX_SECTIONS;
		[self reset];
	}
	return self;
}

#pragma mark - randomization
-(void)reset {
	
	for (int i = 0; i < maxIndexSpace; i++) {
		indexSpace[i] = NO;
	}	
	onceLong = NO;
}
-(double)subRandomize:(int *)interval {
	
	//	Sub randomize
	//
	double result = 0.0;
	
	int firstValue = *(interval + 0);	
	int lastValue  = *(interval + 1);
	int value = 0;
	
	NSLog(@"--->firstValue: %d\tlastValue: %d", firstValue, lastValue);
	
	if (firstValue == lastValue) {
	
		result = lastValue / 1000.0;
	} else {
	
		value = firstValue + arc4random() % (lastValue - firstValue);	
		NSLog(@"-->>range: %d", value);
		
		result = value / 1000.0;
	}
	
	return result;
	
}
-(double)randomizeWithInterval {
	
	double result = 0.0;
	
/*	
	result = (arc4random() % end)/(float)(end)+ start;
	NSLog(@"-->> %g", result);
*/
	int selector = 0;
	
	selector = (arc4random() % MAX_SECTIONS);
	
	//	Mark the indexSpace
	//
	if (![self checkIndexSpaceByIndex:selector]) {
			
		indexSpace[selector] = YES;
	} else {
		
		do {
			
			selector = (arc4random() % MAX_SECTIONS);
			NSLog(@"-->>reselect selector: %i", selector);
			
		} while (([self checkIndexSpaceByIndex:selector] == YES) && (![self allTaken]));
		
		indexSpace[selector] = YES;
	}
		
		
	NSLog(@"-->>selector: %i", selector);
	switch (selector) {
			
		case 0:
			return [self subRandomize:timeIntervalA];
			break;
		case 1:
			return [self subRandomize:timeIntervalB];
			break;
		case 2:
			return [self subRandomize:timeIntervalC];
			break;
		case 3:
			return [self subRandomize:timeIntervalD];
			break;
		case 4:
			return [self subRandomize:timeIntervalE];
			break;
		case 5:
			if (!onceLong) {
				
				//	Only once full time
				//
				onceLong = YES;
				return [self subRandomize:timeIntervalF];
			} 
			return 0.0;
			break;
		default:
			return 0.0;
			break;
	}
	
	return result;
}

-(BOOL)checkIndexSpaceByIndex:(int )index {
	
	if (!(index >= 0 && index < maxIndexSpace))
		return NO;
	
	return indexSpace[index];
}

-(BOOL)allTaken {
	
	int taken = 0;
	for (int i = 0; i < maxIndexSpace; i++) {
		
		if (indexSpace[i]) taken++;
	}
	
	if (taken == maxIndexSpace)
		return YES;
	
	return NO;
}

@end
