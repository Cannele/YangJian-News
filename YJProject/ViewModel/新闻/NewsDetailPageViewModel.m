//
//  NewsDetailPageViewModel.m
//  YJProject
//
//  Created by YangJian on 15/11/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsDetailPageViewModel.h"
#import "NewsNetManager.h"

@interface NewsDetailPageViewModel()

@property (nonatomic,strong) DetailBody *body;

@end

@implementation NewsDetailPageViewModel

- (DetailBody *)body {
    if(_body == nil) {
        _body = [[DetailBody alloc] init];
    }
    return _body;
}

//返回内容
- (NSString *)detailPageContent
{
    NSString *headers = [NSString stringWithFormat:@"<head><style>img{width:320px !important;}</style></head><h2>%@</h2><p>%@</p>",self.body.title,self.body.editTime];
    if (self.body.text == nil) {
        return @"";
    }else{
        return [headers stringByAppendingString:self.body.text];
    }
}

//题目
- (NSString *)detailPageTitle
{
    return self.body.title;
}

//时间
- (NSString *)detailPageDate
{
    return self.body.editTime;
}

- (void)getDetailPageCompleteHandle:(CompletionHandle)completionHandle
{
    [NewsNetManager getDetailNews:self.detailPath completionHandle:^(NewsDetailPageModel *model, NSError *error) {
        self.body = model.body;
        completionHandle(error);
    }];
}

@end
