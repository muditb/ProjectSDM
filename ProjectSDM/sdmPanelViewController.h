//
//  sdmPanelViewController.h
//  ProjectSDM
//
//  Created by Mudit Bhargava on 7/3/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sdmAnalysisViewController.h"

@interface sdmPanelViewController : UIViewController <UIScrollViewDelegate>
{
    IBOutlet UIScrollView *horizontalScrollView;
    NSMutableArray *viewControllers;
    IBOutlet UIPageControl *pageControl;
    BOOL pageControlUsed;
}
@property (strong, nonatomic) NSMutableArray *viewControllers;
@end
