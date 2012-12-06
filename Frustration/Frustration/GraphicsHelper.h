
#import <Foundation/Foundation.h>

/*!
 @class GraphicsHelper
 @abstract This class is a helper class that will contain class methods used to build reusable views
 @updated 2012-10-25
 @superclass NSObject
 */
@interface GraphicsHelper : NSObject


@property (nonatomic, retain) UIView *blockView;
@property (nonatomic, retain) NSArray *disabledViews;

/*!
 *  @method createAndAddBlockingViewToScreen: withMessage
 *  @param screenView The view on which the blocking view will be added
 *  @param message The message that will appear while the blocking view is on the screen
 *  @abstract This method creates a blocking view made of a transparent black view, an activity indicator and a message that will be displayed
 *  @return The blocking view containing the blocking view
 *  @discussion The returned blocking view should be manually removed from the superview by the caller of this method
 */
+(UIView *) createAndAddBlockingViewToScreen:(UIView *) screenView withMessage:(NSString *) message;

-(void) createAndAddBlockingViewToScreen:(UIView *) screenView withMessage:(NSString *) message andDisableViews:(NSArray *) objectsToBeDisabled;

-(void) removeBlockingViewAndEnableViews;

@end
