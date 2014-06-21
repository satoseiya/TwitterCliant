//
//  DetailViewController.h
//  TwitterClient
//
//  Created by 佐藤 誠也 on 2014/06/21.
//  Copyright (c) 2014年 佐藤 誠也. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "AppDelegate.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *idStr;
@property (nonatomic, copy) NSString *httpErrorMessage;
@end
