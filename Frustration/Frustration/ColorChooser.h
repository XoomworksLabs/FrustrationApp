//
//  ColorChooser.h
//  Frustration
//
//  Created by Mihai Popa on 12/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorChooser : NSObject

-(UIColor *) getColorForRow:(NSInteger) row;
-(UIColor *) getCleanColorForRow:(NSInteger ) row;


@end
