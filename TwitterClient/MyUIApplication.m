//
//  MyUIApplication.m
//  TwitterClient
//
//  Created by 佐藤 誠也 on 2014/06/21.
//  Copyright (c) 2014年 佐藤 誠也. All rights reserved.
//

#import "MyUIApplication.h"

@implementation MyUIApplication

-(BOOL)openURL:(NSURL *)url
{
    if(!url) {
        return NO;
    }
    self.myOpenURL = url;
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    WebViewController *webViewController = [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    webViewController.openURL = self.myOpenURL;
    [appDelegate.navigationController pushViewController:webViewController animated:YES];
    self.myOpenURL = nil;
    return YES;

}

@end
