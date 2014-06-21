//
//  WebViewController.h
//  TwitterClient
//
//  Created by 佐藤 誠也 on 2014/06/21.
//  Copyright (c) 2014年 佐藤 誠也. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) NSURL *openURL;

@end
