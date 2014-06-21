//
//  TimeLineCell.h
//  TwitterClient
//
//  Created by 佐藤 誠也 on 2014/06/14.
//  Copyright (c) 2014年 佐藤 誠也. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeLineCell : UITableViewCell

@property (nonatomic, strong) UILabel *tweetTextLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *profileImageView;
@property (nonatomic) CGFloat tweetTextLabelHeight;

@end
