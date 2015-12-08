//
//  NewsViewModel.m
//  YJProject
//
//  Created by YangJian on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsViewModel.h"
#import "NewsModel.h"
@implementation NewsViewModel

- (id)initWithNewsInfoType:(InfoType)type
{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

//预防性编程，防止没有使用initWithType初始化
- (id)init{
    if (self = [super init]) {
        //如果使用此方法初始化，那么崩溃提示
        NSAssert1(NO, @"%s 必须使用initWithType初始化", __func__);
    }
    return self;
}

- (NSInteger)rowNumber
{
    return self.dataArr.count;
}

- (NSMutableArray *)newsPicArr
{
    if (!_newsPicArr) {
        _newsPicArr = [NSMutableArray new];
    }
    return _newsPicArr;
}


- (Item *)modelForArr :(NSArray *)arr row:(NSInteger)row
{
    return arr[row];
}

//返回某行数据的图片
- (NSURL *)iconURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].thumbnail];
}
//返回某行数据的标题
- (NSString *)titleForRow:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].title;
}

//返回某行数据的回复
- (NSString *)replyCountForRow:(NSInteger)row
{
    if([self modelForArr:self.dataArr row:row].commentsall == 0){
        return nil;
    }else{
   return [NSString stringWithFormat:@"%@人评论",[self modelForArr:self.dataArr row:row].commentsall];
    }
}

//返回某行数据的更新时间
- (NSString *)updateTimeForRow:(NSInteger)row
{
    return [[self modelForArr:self.dataArr row:row].updateTime substringFromIndex:11];
}

/** 获取某行数据的链接 */
- (NSString *)detailURLForRowInList:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].ID;
}

/** 是否有滚动条 */
- (BOOL)isExistIndexPic
{
    return self.newsPicArr != nil && self.newsPicArr.count != 0;
}
/** 滚动展示栏的图片 */
- (NSURL *)iconURLForRowInNewsPic:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForArr:self.newsPicArr row:row].thumbnail];
}
/** 滚动展示栏的文字 */
- (NSString *)titleForRowInNewsPic:(NSInteger)row
{
    return [self modelForArr:self.newsPicArr row:row].title;
}
/** 获取滚动栏的链接 */
- (NSString *)detailURLForRowInNewsPic:(NSInteger)row
{
    return [self modelForArr:self.newsPicArr row:row].ID;
}

- (NSInteger)newsPicNumber
{
    return self.newsPicArr.count;
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _page = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    _page += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [NewsNetManager getNewsInfoWithType:_type page:_page completionHandle:^(NewsModel *model, NSError *error) {
        if (_page == 0) {
            [self.dataArr removeAllObjects];
            self.newsPicArr = nil;
        }
        //[self.dataArr addObjectsFromArray:model.data[1]];
        [self deviceFromArr:model.data];
        
        completionHandle(error);
    }];
}

- (void)deviceFromArr:(NSArray*)arr
{
    NSMutableArray *listArr = [NSMutableArray new];
    NSMutableArray *focusArr = [NSMutableArray new];
    int i = 0;
    for (NewsDataModel *model in arr) {
        if (i == 0) {
            [listArr addObjectsFromArray:model.item];
        } else {
            [focusArr addObjectsFromArray:model.item];
        }
        i++;
    }
    self.dataArr = [listArr copy];
    self.newsPicArr = [focusArr copy];
}

@end
