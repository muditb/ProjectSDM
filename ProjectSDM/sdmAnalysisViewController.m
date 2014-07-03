//
//  sdmAnalysisViewController.m
//  ProjectSDM
//
//  Created by Mudit Bhargava on 7/3/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import "sdmAnalysisViewController.h"

@interface sdmAnalysisViewController ()

@end

@implementation sdmAnalysisViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (id)initWithPageNumber:(int)page
{
    if (self = [super initWithNibName:@"sdmAnalysisViewController" bundle:nil])
    {
        pageNumber = page;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    if (pageNumber == 0)
    {
        column1.text = @"SYMPTOMS";
        column2.text = @"DIAGNOSIS";
    }
    else
    {
        column1.text = @"MEDICATION";
        column2.text = @"TREATMENT";
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
