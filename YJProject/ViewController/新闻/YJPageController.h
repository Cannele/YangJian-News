//
//  YJPageController.h
//  YJProject
//
//  Created by YangJian on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WMPageController.h>
@interface YJPageController : WMPageController

//第一页单例，每次进程都只初始化一次
+ (instancetype)standradNews;
@end
