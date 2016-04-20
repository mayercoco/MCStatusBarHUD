//
//  ViewController.m
//  MCStatusBarHUDDemo
//
//  Created by Sugar YP on 16/4/21.
//  Copyright © 2016年 Sugar YP. All rights reserved.
//

#import "ViewController.h"
#import "MCStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)success:(id)sender {
    [MCStatusBarHUD showSuccess:@"加载成功"];
}
- (IBAction)error:(id)sender {
    [MCStatusBarHUD showError:@"加载失败"];
}
- (IBAction)loading:(id)sender {
    [MCStatusBarHUD showLoading:@"正在加载中..."];
}
- (IBAction)hide:(id)sender {
    [MCStatusBarHUD hide];
}

@end
