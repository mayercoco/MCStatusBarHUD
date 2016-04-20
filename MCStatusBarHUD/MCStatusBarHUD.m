//
//  MCStatusBarHUD.m
//  MCStatusBarHUD
//
//  Created by Sugar YP on 16/4/21.
//  Copyright © 2016年 Sugar YP. All rights reserved.
//

#import "MCStatusBarHUD.h"
#define MCMsgFont [UIFont systemFontOfSize:13]

@implementation MCStatusBarHUD

/** 消息的停留时间 */
static CGFloat const MCMessageDuration = 2.0;
/** 消息显示\隐藏的动画时间 */
static CGFloat const MCAnimationDuration = 0.25;

static UIWindow * window_;
static NSTimer * timer_;
+ (void) showWindow
{
    // frame数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor whiteColor] ;
    window_.windowLevel = UIWindowLevelStatusBar;
    window_.frame = frame;
    window_.hidden = NO;
    
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:MCAnimationDuration animations:^{
        window_.frame = frame;
    }];
    
}

+ (void) showSuccess: (NSString * ) msg
{
    [MCStatusBarHUD showMessage:msg iamge:[UIImage imageNamed:@"MCStatusBarHUD.bundle/success"] ];
}
/**
 *  显示错误信息
 */
+ (void) showError: (NSString * ) msg
{
   [MCStatusBarHUD showMessage:msg iamge:[UIImage imageNamed:@"MCStatusBarHUD.bundle/error"] ];
}
/**
 *  显示加载信息
 */
+ (void) showLoading: (NSString * ) msg
{
     // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    [self showWindow];
    UILabel * label = [[UILabel alloc] init];
    label.frame = window_.bounds;
    label.text = msg;
    label.textColor = [UIColor grayColor];
    label.font = MCMsgFont;
    label.textAlignment = NSTextAlignmentCenter;
    
    UIActivityIndicatorView * acView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    CGFloat  msgW = [msg sizeWithAttributes:@{NSFontAttributeName:MCMsgFont}].width;
    CGFloat centerX = (window_.bounds.size.width - msgW)/2 - 30;
    CGFloat centerY =window_.bounds.size.height/2;
    acView.center = CGPointMake(centerX ,centerY);
    [acView startAnimating];
    [window_ addSubview:label];
    [window_ addSubview:acView];
}
/**
 *  隐藏
 */
+ (void) hide
{
    
    [UIView animateWithDuration:MCAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y =  - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

+ (void) showMessage: (NSString * ) msg  iamge : (UIImage *) image
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    [self showWindow];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    }
    
    [button setTitle:msg forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    button.titleLabel.font = MCMsgFont;
    
    [window_ addSubview:button];
    timer_ = [NSTimer scheduledTimerWithTimeInterval:MCMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];

}
@end
