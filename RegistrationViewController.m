//
//  RegistrationViewController.m
//  ProjectSDM
//
//  Created by Mudit Bhargava on 6/5/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)authenticate
{
    sdmPassVC = [[sdmPassCodeViewController alloc] init];
    sdmPassVC.delegate = self;
    [self presentViewController:sdmPassVC animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    sdmFormViewController *formVC = [[sdmFormViewController alloc] init];
    sdmSuggestionsTableViewController *suggestionsVC = [[sdmSuggestionsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    splitVC.viewControllers = [NSArray arrayWithObjects:suggestionsVC,formVC, nil];
    
    [self.view addSubview:splitVC.view];
    [splitVC.view sizeToFit];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated
{
    BOOL authenticationRequired = [[NSUserDefaults standardUserDefaults] boolForKey:@"authenticationRequired"];
    if (authenticationRequired)
    {
        [self authenticate];
    }
}
-(void)didAuthenticate
{
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"authenticationRequired"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [sdmPassVC dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
