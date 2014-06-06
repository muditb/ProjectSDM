//
//  RegistrationViewController.h
//  ProjectSDM
//
//  Created by Mudit Bhargava on 6/5/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sdmFormViewController.h"
#import "sdmSuggestionsTableViewController.h"
#import "sdmPassCodeViewController.h"

@interface RegistrationViewController : UIViewController <sdmPassCodeViewControllerDelegate>
{
    IBOutlet UISplitViewController *splitVC;
    sdmPassCodeViewController *sdmPassVC;
}
-(void)authenticate;
@end
