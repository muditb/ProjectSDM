//
//  sdmPassCodeViewController.h
//  ProjectSDM
//
//  Created by Mudit Bhargava on 6/6/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol sdmPassCodeViewControllerDelegate;

@interface sdmPassCodeViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
{
    id <sdmPassCodeViewControllerDelegate> delegate;
    IBOutletCollection(UIButton) NSArray *keyPad;
    IBOutlet UITextField *pinField;
    NSMutableString *pinEntered;
    IBOutlet UIImageView *backgroundImage;
}
-(IBAction)hackIn:(id)sender;
-(IBAction)pressedKey:(UIButton *)sender;
-(IBAction)clearNum:(UIButton *)sender;
-(IBAction)callSupport:(UIButton *)sender;

@property (strong, nonatomic) id<sdmPassCodeViewControllerDelegate> delegate;
@end

@protocol sdmPassCodeViewControllerDelegate
-(void)didAuthenticate;
@end

