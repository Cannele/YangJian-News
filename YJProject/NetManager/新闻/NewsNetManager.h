//
//  NewsNetManager.h
//  YJProject
//
//  Created by YangJian on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

typedef NS_ENUM(NSInteger,InfoType)
{
    InfoTypeTouTiao, //头条
    InfoTypeYuLe,    //娱乐
    InfoTypeShiShang, //时尚
    InfoTypeTiYu,    //体育
    InfoTypeKeJi,    //科技
    InfoTypeQiChe,   //汽车
    InfoTypeJunShi,  //军事
    InfoTypeLiShi,   //历史
    
};


@interface NewsNetManager : BaseNetManager

+ (id)getNewsInfoWithType:(InfoType)type page:(NSInteger)page kCompletionHandle;

+ (id)getDetailNews:(NSString *)urlStr kCompletionHandle;

@end
