
#import "GraphicsHelper.h"

@implementation GraphicsHelper

@synthesize disabledViews, blockView;


-(id)init
{
    if (self = [super init])
    {
        
    }
    return self;
}

-(void) createAndAddBlockingViewToScreen:(UIView *) screenView withMessage:(NSString *) message andDisableViews:(NSArray *) objectsToBeDisabled
{
    self.disabledViews = objectsToBeDisabled;
    UIView *blockingView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [blockingView setBackgroundColor:[UIColor blackColor]];
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    CGRect indicatorFrame = indicator.frame;
    indicatorFrame.size.height = indicatorFrame.size.height * 2;
    indicatorFrame.size.width = indicatorFrame.size.width * 2;
    indicator.frame = indicatorFrame;
    [blockingView setAlpha:0.5];
    [blockingView addSubview:indicator];
    indicator.center = blockingView.center;
    
    [indicator startAnimating];
    if (message)
    {
        UILabel *blockingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
        blockingLabel.text =message;
        [blockingLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:25]];
        [blockingLabel setTextAlignment:UITextAlignmentCenter];
        blockingLabel.center = blockingView.center;
        CGRect frame = blockingLabel.frame;
        frame.origin.y -= indicator.frame.size.height;
        blockingLabel.frame = frame;
        blockingLabel.backgroundColor = [UIColor clearColor];
        blockingLabel.textColor = [UIColor whiteColor];
        [blockingView addSubview:blockingLabel];
    }
    [screenView addSubview:blockingView];
    self.blockView = blockingView;
    for (NSObject *view in objectsToBeDisabled) {
        if ([view isKindOfClass:[UIView class]])
        {
            [(UIView *) view setUserInteractionEnabled:NO];
        }
        else if ([view isKindOfClass:[UIBarItem class]])
        {
            [(UIBarItem *) view setEnabled:NO];
        }
    }
}

-(void) removeBlockingViewAndEnableViews
{
    [self.blockView removeFromSuperview];
    for (NSObject *view in disabledViews) {
        if ([view isKindOfClass:[UIView class]])
        {
            [(UIView *) view setUserInteractionEnabled:YES];
        }
        else if ([view isKindOfClass:[UIBarItem class]])
        {
            [(UIBarItem *) view setEnabled:YES];
        }
    }
}

+(UIView *) createAndAddBlockingViewToScreen:(UIView *) screenView withMessage:(NSString *) message
{
    UIView *blockingView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [blockingView setBackgroundColor:[UIColor blackColor]];
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    CGRect indicatorFrame = indicator.frame;
    indicatorFrame.size.height = indicatorFrame.size.height * 2;
    indicatorFrame.size.width = indicatorFrame.size.width * 2;
    indicator.frame = indicatorFrame;
    [blockingView setAlpha:0.5];
    [blockingView addSubview:indicator];
    indicator.center = blockingView.center;

    [indicator startAnimating];
    if (message)
    {
        UILabel *blockingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
        blockingLabel.text =message;
        [blockingLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:30]];
        [blockingLabel setTextAlignment:UITextAlignmentCenter];
        blockingLabel.center = blockingView.center;
        CGRect frame = blockingLabel.frame;
        frame.origin.y -= indicator.frame.size.height;
        blockingLabel.frame = frame;
        blockingLabel.backgroundColor = [UIColor clearColor];
        blockingLabel.textColor = [UIColor whiteColor];
        [blockingView addSubview:blockingLabel];
    }
    [screenView addSubview:blockingView];
    return blockingView;
}

@end
