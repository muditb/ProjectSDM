//
//  sdmFormViewController.m
//  ProjectSDM
//
//  Created by Mudit Bhargava on 6/5/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import "sdmFormViewController.h"

@interface sdmFormViewController ()

@end

@implementation sdmFormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)saveAndContinue:(id)sender
{
    sdmPanelViewController *spvc = [[sdmPanelViewController alloc] init];
    [self presentViewController:spvc animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
