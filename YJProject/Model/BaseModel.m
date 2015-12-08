//
//  BaseModel.m
//  YJProject
//
//  Created by YangJian on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

MJCodingImplementation

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"typeName": @"typename", @"ID": @"id", @"desc": @"description"};
}

@end

