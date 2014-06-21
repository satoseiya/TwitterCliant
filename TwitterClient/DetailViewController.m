//
//  DetailViewController.m
//  TwitterClient
//
//  Created by 佐藤 誠也 on 2014/06/21.
//  Copyright (c) 2014年 佐藤 誠也. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileimageView;
@property (weak, nonatomic) IBOutlet UITextView *nameView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation DetailViewController

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
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Detail View";
    self.profileimageView.image = self.image;
    self.nameView.text = self.name;
    self.textView.text = self.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (IBAction)retweetAction:(id)sender {
    
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    ACAccount *account = [accountStore accountWithIdentifier:self.identifier];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.twitter.com"
                  @"/1.1/statuses/retweet/%@.json", self.idStr]];
    
    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                            requestMethod:SLRequestMethodPOST
                                                      URL:url
                                               parameters:nil];
    request.account = account;
    
    UIApplication *application = [UIApplication sharedApplication];
    application.networkActivityIndicatorVisible = YES;
    
    [request performRequestWithHandler:^(NSData *responseData,
                                         NSHTTPURLResponse *urlResponse,
                                         NSError *error) {
        if (responseData) {
            self.httpErrorMessage = nil;
            if (urlResponse.statusCode >= 200 &&urlResponse.statusCode < 300) {
                NSDictionary *postResponseData = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:NULL];
                NSLog(@"SUCCESS! Created Retwee with ID: %@", postResponseData[@"id_str"]);
            }else{
                self.httpErrorMessage = [NSString stringWithFormat:@"The response code is %d", urlResponse.statusCode];
                NSLog(@"HTTP Error: %@", self.httpErrorMessage);
            }
        }else{
            NSLog(@"ERROR: An error occurred while requesting: %@", [error localizedDescription]);
        }
        dispatch_async(dispatch_get_main_queue(),^{
            UIApplication *application = [UIApplication sharedApplication];
            application.networkActivityIndicatorVisible = NO;
        });
    }];
}

@end
