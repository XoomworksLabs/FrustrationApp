//
//  Randomizer.h
//  Frustration
//
//  Created by Alexandru Gavrila on 12/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <stdlib.h>
#define PAIR_ELEMENTS			2
#define MAX_SECTIONS			6

@interface Randomizer : NSObject {
	
	int timeIntervalA[PAIR_ELEMENTS];
	int timeIntervalB[PAIR_ELEMENTS];	
	int timeIntervalC[PAIR_ELEMENTS];	
	int timeIntervalD[PAIR_ELEMENTS];
	int timeIntervalE[PAIR_ELEMENTS];	
	int timeIntervalF[PAIR_ELEMENTS];	
	
	BOOL onceLong;
	
	BOOL indexSpace[MAX_SECTIONS];
	int  maxIndexSpace;
}

-(double)randomizeWithInterval;
-(void)reset;
@end
