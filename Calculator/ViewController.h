//
//  ViewController.h
//  Calculator
//
//  Created by HsuAnny on 6/24/15.
//  Copyright (c) 2015 HsuAnny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "calcModel.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "Branch.h"

@interface ViewController : UIViewController<calcModelDelegate, UITableViewDataSource,UITableViewDelegate, MFMessageComposeViewControllerDelegate>
{
    IBOutlet UITableView *historyTableView;
    UIButton *backButton;
    NSMutableArray *resultArray;
}

-(void) buttonClick:(id)sender;
-(void) displayTable;
-(void) removeTable;
-(void) displayPic;
-(void) share;

@end

