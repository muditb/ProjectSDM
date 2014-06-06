//
//  sdmPassCodeViewController.m
//  ProjectSDM
//
//  Created by Mudit Bhargava on 6/6/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import "sdmPassCodeViewController.h"
#import "UIImage+ImageEffects.h"

@interface sdmPassCodeViewController ()

@end

@implementation sdmPassCodeViewController
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        pinEntered = [[NSMutableString alloc] initWithCapacity:4];
        [pinEntered setString:@""];
    }
    return self;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}
-(void)authenticate
{
    NSString *correctPIN = [[NSUserDefaults standardUserDefaults] stringForKey:@"PIN"];
    
    if ([pinEntered isEqualToString:correctPIN])
    {
        [self.delegate didAuthenticate];
    }
    else
    {
        [pinEntered setString:@""];
        pinField.text  = @"";
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    pinField.secureTextEntry = YES;
    pinField.delegate = self;
    
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *destPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [destPath stringByAppendingPathComponent:@"bgImage"];
    
    if([fileManager fileExistsAtPath:filePath])
    {
        UIImage *bgImage = [UIImage imageWithContentsOfFile:filePath];
        UIImage *modBgImage = [bgImage applyLightEffect];
        UIImage *finalBgImage = [modBgImage initWithCGImage:modBgImage.CGImage scale:1.0 orientation:UIImageOrientationRight];
        backgroundImage.image = finalBgImage;
    }
    
    
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)hackIn:(id)sender
{
    [self.delegate didAuthenticate];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)pressedKey:(UIButton *)sender
{
    [pinEntered appendString:sender.titleLabel.text];
    pinField.text = pinEntered;
    if ([pinEntered length] == 4)
    {
        [self authenticate];
    }
}
-(IBAction)clearNum:(UIButton *)sender
{
    if ([pinEntered length] >= 1)
    {
        [pinEntered deleteCharactersInRange:NSMakeRange([pinEntered length]-1, 1)];
        pinField.text = pinEntered;
    }
}
-(IBAction)callSupport:(UIButton *)sender
{
    UIAlertView *supportAlert = [[UIAlertView alloc] initWithTitle:@"Support" message:@"Please call +91-9711528958" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
    [supportAlert show];
    
}
@end
