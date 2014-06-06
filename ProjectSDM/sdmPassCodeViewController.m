//
//  sdmPassCodeViewController.m
//  ProjectSDM
//
//  Created by Mudit Bhargava on 6/6/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import "sdmPassCodeViewController.h"

@interface sdmPassCodeViewController ()

@end

@implementation sdmPassCodeViewController
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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

@end
