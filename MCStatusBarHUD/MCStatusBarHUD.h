//
//  MCStatusBarHUD.h
//  MCStatusBarHUD
//
//  Created by Sugar YP on 16/4/21.
//  Copyright © 2016年 Sugar YP. All rights reserved.
//

#import <UIkit/UIkit.h>

@interface MCStatusBarHUD : NSObject
/**
 *  显示成功信息
 */
+ (void) showMessage: (NSString * ) msg  iamge : (UIImage *) image;
/**
 *  显示成功信息
 */
+ (void) showSuccess: (NSString * ) msg;
/**
 *  显示错误信息
 */
+ (void) showError: (NSString * ) msg;
/**
 *  显示加载信息
 */
+ (void) showLoading: (NSString * ) msg;
/**
 *  隐藏
 */
+ (void) hide;
@end
