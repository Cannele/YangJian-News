//
//  YJPageController.m
//  YJProject
//
//  Created by YangJian on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "YJPageController.h"
#import "NewsViewModel.h"
#import "YJNewsViewController.h"
@interface YJPageController ()

@end

@implementation YJPageController

+ (instancetype)standradNews
{
    static YJPageController *vc = nil;
    static dispatch_once_t onceToKen;
    dispatch_once(&onceToKen, ^{
        vc = [[YJPageController alloc]initWithViewControllerClasses:[self itemsClasses] andTheirTitles:[self itemsArr]];
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        
    });
    return vc;
}

//提供题目数组
+ (NSArray *)itemsArr
{
    return @[@"头条",@"娱乐",@"时尚",@"体育",@"科技",@"汽车",@"军事",@"历史"];
}

//提供题目对应的控制器 tips:数量要一致!!!
+ (NSArray *)itemsClasses
{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemsArr]) {
        [arr addObject:[YJNewsViewController class]];
    }
    return [arr copy];
}


/** 提供每个VC对应的values值数组 */
+ (NSArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i <[self itemsArr].count; i++) {
        //数值上，vc的infoType的枚举值 恰好和i值相同
        [arr addObject:@(i)];
    }
    return arr;
}
/** 提供每个VC对应的key值数组 */
+ (NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemsArr]) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
