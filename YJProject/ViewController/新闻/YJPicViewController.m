//
//  YJPicViewController.m
//  YJProject
//
//  Created by YangJian on 15/12/1.
//  Copyright © 2015年 YangJian. All rights reserved.
//

#import "YJPicViewController.h"
#import "NewsViewModel.h"
#import "NewsDetailPageViewModel.h"
@interface YJPicViewController ()<MWPhotoBrowserDelegate>
@property (nonatomic,strong) NewsViewModel *newsVM;
@property (nonatomic,strong) NewsDetailPageViewModel *detailVM;
@end

@implementation YJPicViewController

- (NewsViewModel *)newsVM {
    if(_newsVM == nil) {
        _newsVM = [[NewsViewModel alloc] initWithNewsInfoType:_infoType.integerValue];
    }
    return _newsVM;
}

- (NewsDetailPageViewModel *)detailVM {
    if(_detailVM == nil) {
        _detailVM = [[NewsDetailPageViewModel alloc] init];
    }
    return _detailVM;
}

- (id)initWithUrlStr:(NSString *)urlStr
{
    if (self = [super init]) {
        _urlStr = urlStr;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailVM.detailPath = self.urlStr;
    self.view.backgroundColor = [UIColor whiteColor];
    MWPhotoBrowser *photoBrowser = [[MWPhotoBrowser alloc]initWithDelegate:self];
    //页面不是推出，而是取代navi
    NSMutableArray *naviVCs = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    //删除掉最后一个控制器，即当前的白色控制器
    [naviVCs removeLastObject];
    //把图片控制器添加到最后
    [naviVCs addObject:photoBrowser];
    //把新的控制器数组赋值给导航控制器
    self.navigationController.viewControllers = naviVCs;
}

#pragma mark - MWPhotoBrowserDelegate
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser
{
    return self.newsVM.newsPicNumber;
}

- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index
{
    MWPhoto *photo = [MWPhoto photoWithURL:[NSURL URLWithString:self.detailVM.detailPath]];
    return photo;
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
