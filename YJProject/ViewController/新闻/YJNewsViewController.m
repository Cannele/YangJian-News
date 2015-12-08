//
//  YJNewsViewController.m
//  YJProject
//
//  Created by YangJian on 15/11/21.
//  Copyright © 2015年 yangjian. All rights reserved.
//

#import "YJNewsViewController.h"
#import "YJNewsCell.h"
#import "NewsViewModel.h"
#import "iCarousel.h"
#import "YJHtmlViewController.h"
#import "YJPicViewController.h"

@interface YJNewsViewController ()<iCarouselDataSource,iCarouselDelegate>
@property (nonatomic,strong) NewsViewModel *newsVM;
@end

@implementation YJNewsViewController
{
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}
- (NewsViewModel *)newsVM {
    if(_newsVM == nil) {
        _newsVM = [[NewsViewModel alloc] initWithNewsInfoType:_infoType.integerValue];
    }
    return _newsVM;
}

/** 头部滚动 */
- (UIView *)headerView
{
    [_timer invalidate];
    if(!self.newsVM.isExistIndexPic) return nil;
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 220)];
    //底部
    UIView *butoomView = [UIView new];
    butoomView.backgroundColor = [UIColor whiteColor];
    [headView addSubview:butoomView];
    [butoomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    _titleLb = [UILabel new];
    [butoomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _titleLb.text = [self.newsVM titleForRowInNewsPic:0];
    
    //添加小圆点控件
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.newsVM.newsPicNumber;
    [butoomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(-10);
    }];
    _pageControl.pageIndicatorTintColor = [UIColor blackColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    //小圆点 不能与用户交互
    _pageControl.userInteractionEnabled = NO;
    
    //添加滚动栏
    _ic = [iCarousel new];
    [headView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(butoomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    //只有一张图的时候不滚动
    _ic.scrollEnabled = self.newsVM.newsPicNumber != 1;
    
    if (self.newsVM.newsPicNumber > 1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    return headView;
}

#pragma mark - iCarouselDataSource,iCarouselDelegate
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.newsVM.newsPicNumber;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750 * 440 - 35)];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.newsVM iconURLForRowInNewsPic:index]];
    return view;
}

#pragma mark - iCarouselDataSource,iCarouselDelegate
/** 允许循环滚动 */
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}
/** 监控当前在第几张 */
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    _titleLb.text = [self
                     .newsVM titleForRowInNewsPic:carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[YJNewsCell class] forCellReuseIdentifier:@"NewsListCell"];

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.newsVM refreshDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self headerView];
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.newsVM getMoreDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self headerView];
            [self.tableView.mj_footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YJNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsListCell" forIndexPath:indexPath];
    [cell.iconIV setImageWithURL:[self.newsVM iconURLForRow:indexPath.row]];
    cell.titleLb.text = [self.newsVM titleForRow:indexPath.row];
    cell.replyCountLb.text = [self.newsVM replyCountForRow:indexPath.row];
    cell.updateTime.text = [self.newsVM updateTimeForRow:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

/** 去掉分割线左侧缝隙 */
kRemoveCellSeparator

/** 列表选中后触发 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YJHtmlViewController *vc = [[YJHtmlViewController alloc]initWithUrlStr:[self.newsVM detailURLForRowInList:indexPath.row]];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

/** 滚动栏选中后触发 */
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    YJPicViewController *vc = [[YJPicViewController alloc]initWithUrlStr:[self.newsVM detailURLForRowInNewsPic:index]];
    
    [self.navigationController pushViewController:vc animated:YES];
}
@end
