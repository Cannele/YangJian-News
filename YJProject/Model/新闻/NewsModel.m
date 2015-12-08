//
//  NewsModel.m
//  YJProject
//
//  Created by YangJian on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel



+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [NewsDataModel class]};
}
@end


@implementation NewsDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"item" : [Item class]};
}

@end


@implementation Item
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}
@end


@implementation ItemLink

@end


