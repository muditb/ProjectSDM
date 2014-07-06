//
//  sdmFormViewController.m
//  ProjectSDM
//
//  Created by Mudit Bhargava on 6/5/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import "sdmFormViewController.h"

@interface sdmFormViewController (){
    NSString *fname,*lname,*sex,*mobile,*did,*dob;
}

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
    
    
    
    ///edits not completed.
    NSString *ste=[[NSUserDefaults standardUserDefaults] objectForKey:@"d_id"];
    
    NSString *urlstring=@"http://hospitaldemo.azurewebsites.net/index.aspx?type=patlog&fname=";
    urlstring=[urlstring stringByAppendingString:pinEntered];
    
    NSURL *url= [[NSURL alloc]initWithString:urlstring];
    NSData *data= [[NSData alloc]initWithContentsOfURL:url];
    NSError *error;
    NSMutableDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSString *key=[dic objectForKey:@"pin"];
    if([pinEntered isEqualToString:key])
    {
        NSUserDefaults *d_id=[NSUserDefaults standardUserDefaults];
        if(d_id)
        {
            [d_id setObject:[NSString stringWithString:pinEntered] forKey:@"d_id"];
            [d_id synchronize];
        }
        [self.delegate didAuthenticate];
    }
    else{
        [pinEntered setString:@""];
        pinField.text=@"";
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"pin not exixts" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"cancel", nil];
        [alert show];
    }
    
    
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
