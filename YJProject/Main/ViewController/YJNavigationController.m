//
//  YJNavigationController.m
//  YJProject
//
//  Created by YangJian on 15/11/21.
//  Copyright © 2015年 yangjian. All rights reserved.
//

#import "YJNavigationController.h"

@interface YJNavigationController ()

@end

@implementation YJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/** 全局统一处理导航条 */
+ (void)initialize
{
//    UINavigationBar *bar = [UINavigationBar appearance];
//    [bar setBarStyle:UIBarStyleBlack];
    //获取UIBarButtonItem外观
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    //可变字典保存配置
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:att forState:UIControlStateNormal];
}

@end
