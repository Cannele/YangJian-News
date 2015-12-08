//
//  NewsDetailPageModel.m
//  YJProject
//
//  Created by YangJian on 15/11/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsDetailPageModel.h"

@implementation NewsDetailPageModel

@end
@implementation DetailMeta

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID": @"id",@"classes":@"class"};
}
@end

@implementation DetailBody

+ (NSDictionary *)objectClassInArray{
    return @{@"img" : [DetailImg class]};
}

@end


@implementation DetailImg

@end


@implementation DetailSize

@end


