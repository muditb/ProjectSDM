//
//  RegistrationViewController.m
//  ProjectSDM
//
//  Created by Mudit Bhargava on 6/5/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController (){
    NSString *fname,*lname,*sex,*mobile,*dob,*did;
}

@end

@implementation RegistrationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"hello4");
        // Custom initialization
    }
    return self;
}
-(void)authenticate
{
    NSLog(@"hello1");
    sdmPassVC = [[sdmPassCodeViewController alloc] init];
    sdmPassVC.delegate = self;
    [self presentViewController:sdmPassVC animated:YES completion:nil];
}

- (void)viewDidLoad
{
    
   NSLog(@"hello2");
    [super viewDidLoad];
    sdmFormViewController *formVC = [[sdmFormViewController alloc] init];
    
    sdmSuggestionsTableViewController *suggestionsVC = [[sdmSuggestionsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    splitVC.viewControllers = [NSArray arrayWithObjects:suggestionsVC,formVC, nil];
    [self.view addSubview:splitVC.view];
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(authenticate) name:UIApplicationDidBecomeActiveNotification object:nil];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"hello5");
//    BOOL authenticationRequired = [[NSUserDefaults standardUserDefaults] boolForKey:@"authenticationRequired"];
//    if (authenticationRequired)
//    {
//        [self authenticate];
//    }
}
-(void)didAuthenticate
{
    
    [sdmPassVC dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
