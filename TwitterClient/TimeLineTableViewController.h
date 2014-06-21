//
//  TimeLineTableViewController.h
//  TwitterClient
//
//  Created by 佐藤 誠也 on 2014/06/14.
//  Copyright (c) 2014年 佐藤 誠也. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "TimeLineCell.h"
#import "DetailViewController.h"

@interface TimeLineTableViewController : UITableViewController

@property (nonatomic, copy) NSString *identifier;

@end
