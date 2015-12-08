//
//  YJTabBarController.m
//  YJProject
//
//  Created by YangJian on 15/11/21.
//  Copyright © 2015年 yangjian. All rights reserved.
//

#import "YJTabBarController.h"
#import "YJNavigationController.h"
#import "YJTabBarController.h"
#import "UIImage+Image.h"

#import "YJNewsViewController.h"
#import "YJListenViewController.h"
#import "YJVideoViewController.h"
#import "YJMeViewController.h"
#import "YJPageController.h"

@interface YJTabBarController ()

@end

@implementation YJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addAllChildController];
}

/** 添加子控制器 调用一个封装的添加方法*/
- (void)addAllChildController
{
    //新闻
//    YJNewsViewController *news = [[YJNewsViewController alloc]init];
//    [self addOneChildController:news image:[UIImage imageNamed:@"tabbar_icon_news_normal"] selectedImage:[UIImage imageWithOriginaName:@"tabbar_icon_news_highlight"] title:@"新闻"];
//    news.view.backgroundColor = [UIColor whiteColor];
    YJPageController *newNavi = [YJPageController standradNews];
    [self addOneChildController:newNavi image:[UIImage imageNamed:@"tabbar_icon_news_normal"] selectedImage:[UIImage imageWithOriginaName:@"tabbar_icon_news_highlight"] title:@"新闻"];
    
    //听听
    YJListenViewController *listen = [[YJListenViewController alloc]init];
    [self addOneChildController:listen image:[UIImage imageNamed:@"tabbar_icon_listen_normal"] selectedImage:[UIImage imageWithOriginaName:@"tabbar_icon_listen_highlight"] title:@"听听"];
    
    //视频
    YJVideoViewController *video = [[YJVideoViewController alloc]init];
    [self addOneChildController:video image:[UIImage imageNamed:@"tabbar_icon_media_normal"] selectedImage:[UIImage imageWithOriginaName:@"tabbar_icon_media_highlight"] title:@"视频"];
    
    //我
    YJMeViewController *me = [[UIStoryboard storyboardWithName:@"YJMe" bundle:nil]instantiateViewControllerWithIdentifier:@"loginVC"];
    [self addOneChildController:me image:[UIImage imageNamed:@"tabbar_icon_me_normal"] selectedImage:[UIImage imageWithOriginaName:@"tabbar_icon_me_highlight"] title:@"我"];
}

/** 添加方法 */
- (void)addOneChildController:(UIViewController *)vc
                        image:(UIImage *)image
                selectedImage:(UIImage *)selectedImage
                        title:(NSString *)title;
{
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    vc.title = title;
    
    /** 给每个控制器包装一个导航控制器 */
    YJNavigationController *navi = [[YJNavigationController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:navi];
}

/** 统一处理TabBar */
+ (void)initialize
{
    //获取TabBarItem外观
    UITabBarItem *item = [UITabBarItem appearance];
    //创建字典来保存属性
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att [NSForegroundColorAttributeName] = [UIColor redColor];
    //设置
    [item setTitleTextAttributes:att forState:UIControlStateSelected];
    
//    UITabBar *tabBar = [UITabBar appearance];
//    [tabBar setBackgroundImage:[UIImage imageNamed:@"tab-bar-background"]];
    
}

@end
