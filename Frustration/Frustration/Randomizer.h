//
//  Randomizer.h
//  Frustration
//
//  Created by Alexandru Gavrila on 12/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <stdlib.h>

@interface Randomizer : NSObject

-(double)randomizeWithInterval:(u_int32_t) start and:(u_int32_t) end;
@end