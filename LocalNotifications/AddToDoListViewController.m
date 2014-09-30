//
//  AddToDoListViewController.m
//  LocalNotifications
//
//  Created by paradigm creatives on 9/30/14.
//  Copyright (c) 2014 Paradigm Creatives. All rights reserved.
//

#import "AddToDoListViewController.h"

@interface AddToDoListViewController ()

@end

@implementation AddToDoListViewController
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
    self.txt.delegate=self;
    [self.txt becomeFirstResponder];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addItem:(id)sender {
    NSLog(@"added");
    [self.txt resignFirstResponder];
    
    NSDate *pickerDate = [self.picker date];
    
    // Schedule the notification
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = pickerDate;
    localNotification.alertBody = self.txt.text;
    localNotification.alertAction = @"Show me the item";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    // Request to reload table view data
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}
- (IBAction)cancelItem:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.txt resignFirstResponder];
    return NO;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
