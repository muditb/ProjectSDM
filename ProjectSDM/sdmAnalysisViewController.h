//
//  sdmAnalysisViewController.h
//  ProjectSDM
//
//  Created by Mudit Bhargava on 7/3/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sdmAnalysisViewController : UIViewController
{
    IBOutlet UILabel *column1;
    IBOutlet UILabel *column2;
    NSUInteger pageNumber;
}
- (id)initWithPageNumber:(int)page;
@end
