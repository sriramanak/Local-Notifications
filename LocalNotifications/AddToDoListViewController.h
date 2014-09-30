//
//  AddToDoListViewController.h
//  LocalNotifications
//
//  Created by paradigm creatives on 9/30/14.
//  Copyright (c) 2014 Paradigm Creatives. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddToDoListViewController : UIViewController
@property(nonatomic,weak) IBOutlet UITextField *txt;
@property(nonatomic,weak) IBOutlet UIDatePicker *picker;
-(IBAction)addItem:(id)sender;
-(IBAction)cancelItem:(id)sender;

@end
