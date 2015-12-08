//
//  NewsNetManager.m
//  YJProject
//
//  Created by YangJian on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsNetManager.h"
#import "NewsModel.h"
#import "NewsDetailPageModel.h"
#define kNewsPath @"http://api.iclient.ifeng.com/ClientNews"
#define kGv @"gv":@"4.6.5"
#define kAv @"av":@0
#define kProid @"proid":@"ifengnews"
#define kOS @"os": [@"ios_" stringByAppendingString\
:[UIDevice currentDevice].systemVersion]
#define kVt @"vt":@5
#define kScreen @"screen":@"750x1334"
#define kPublishid @"publishid":@4002
#define kUid @"uid":@"a8815b88b04df04fdc920e3b21776ab16519aedd"

#define kSetId(string, dic)        [dic setObject:string forKey:@"id"];

@implementation NewsNetManager
+ (id)getNewsInfoWithType:(InfoType)type page:(NSInteger)page kCompletionHandle
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kGv,kAv,kProid,kOS,kVt,kScreen,kPublishid,@"page":@(page),kUid}];
    
    switch (type) {
        case InfoTypeTouTiao:
            kSetId(@"SYLB10,SYDT10,SYRECOMMEND", params);
            break;
        case InfoTypeYuLe:
            kSetId(@"YL53,FOCUSYL53", params);
            break;
        case InfoTypeShiShang:
            kSetId(@"SS78,FOCUSSS78", params);
            break;
        case InfoTypeTiYu:
            kSetId(@"TY43,FOCUSTY43,TYLIVE", params);
            break;
        case InfoTypeKeJi:
            kSetId(@"KJ123,FOCUSKJ123", params);
            break;
        case InfoTypeQiChe:
            kSetId(@"QC45,FOCUSQC45", params);
            break;
        case InfoTypeJunShi:
            kSetId(@"JS83,FOCUSJS83", params);
            break;
        case InfoTypeLiShi:
            kSetId(@"LS153,FOCUSLS153", params);
            break;
        default:
            break;
    }
    NSString *path = [self percentPathWithPath:kNewsPath params:params];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([NewsModel mj_objectWithKeyValues:[self transformWithArr:responseObj]],error);
    }];
}

+ (NSDictionary*)transformWithArr:(NSArray *)arr
{
    NSDictionary *responDic = [NSDictionary dictionaryWithObject:arr forKey:@"data"];
    return responDic;
}

/** 详情 */
+ (id)getDetailNews:(NSString *)urlStr completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSString *path = [self percentPathWithPath:urlStr params:nil];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([NewsDetailPageModel mj_objectWithKeyValues:responseObj],error);
    }];
}

@end
