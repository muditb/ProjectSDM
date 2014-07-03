//
//  sdmPanelViewController.m
//  ProjectSDM
//
//  Created by Mudit Bhargava on 7/3/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import "sdmPanelViewController.h"

@interface sdmPanelViewController ()

@end

NSUInteger kNumberOfPages = 2;

@implementation sdmPanelViewController
@synthesize viewControllers;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)setup
{
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    NSArray *views = [horizontalScrollView subviews];
    for (UIView *v in views)
    {
        [v removeFromSuperview];
    }
    for (unsigned i = 0; i < kNumberOfPages; i++)
    {
		[controllers addObject:[NSNull null]];
    }
    
    self.viewControllers = controllers;
    
    NSUInteger additionalSpace = 2;
    
    NSString *req = [[NSUserDefaults standardUserDefaults] stringForKey:@"request"];
    
    if (([req isEqualToString:@"starred"]) || ([req isEqualToString:@"history"]) || (kNumberOfPages > 1))
    {
        additionalSpace = 0;
    }
    horizontalScrollView.contentSize = CGSizeMake(horizontalScrollView.frame.size.width * kNumberOfPages + additionalSpace, horizontalScrollView.frame.size.height);
    horizontalScrollView.showsHorizontalScrollIndicator = NO;
    horizontalScrollView.delegate = self;
    horizontalScrollView.showsVerticalScrollIndicator = NO;
    pageControl.numberOfPages = kNumberOfPages;
    pageControl.currentPage = 0;
    

}
- (void)loadScrollViewWithPage:(int)page
{
    if (page < 0)
        return;
    if (page >= kNumberOfPages)
        return;
    
    // replace the placeholder if necessary
    sdmAnalysisViewController *controller = [self.viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null])
    {
        controller = [[sdmAnalysisViewController alloc] initWithPageNumber:page];
        //controller.delegate = self;
        [viewControllers replaceObjectAtIndex:page withObject:controller];
    }
    
    // add the controller's view to the scroll view
    if (controller.view.superview == nil)
    {
        CGRect frame = horizontalScrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        
        [horizontalScrollView addSubview:controller.view];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
    
    // Do any additional setup after loading the view from its nib.
}
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    
    if (pageControlUsed)
    {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
    
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = horizontalScrollView.frame.size.width;
    int page = floor((horizontalScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
    
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
    // A possible optimization would be to unload the views+controllers which are no longer visible
}

// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)_scrollView
{
    pageControlUsed = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
