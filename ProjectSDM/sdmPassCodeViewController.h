//
//  sdmPassCodeViewController.h
//  ProjectSDM
//
//  Created by Mudit Bhargava on 6/6/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol sdmPassCodeViewControllerDelegate;

@interface sdmPassCodeViewController : UIViewController
{
    id <sdmPassCodeViewControllerDelegate> delegate;
}
-(IBAction)hackIn:(id)sender;
@property (strong, nonatomic) id<sdmPassCodeViewControllerDelegate> delegate;
@end

@protocol sdmPassCodeViewControllerDelegate
-(void)didAuthenticate;
@end

