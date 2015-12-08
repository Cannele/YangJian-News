//
//  NewsViewModel.h
//  YJProject
//
//  Created by YangJian on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "NewsNetManager.h"
@interface NewsViewModel : BaseViewModel

- (id)initWithNewsInfoType:(InfoType)type;
@property (nonatomic) InfoType type;

@property (nonatomic) NSInteger rowNumber;
@property (nonatomic) NSInteger page;

//列表
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)replyCountForRow:(NSInteger)row;
- (NSString *)updateTimeForRow:(NSInteger)row;
/** 获取某行数据的链接 */
- (NSString *)detailURLForRowInList:(NSInteger)row;




//保存头部滚动数组
@property (nonatomic,strong) NSMutableArray *newsPicArr;
///** 是否有滚动条 */
@property(nonatomic, getter=isExistIndexPic) BOOL existIndexPic;
/** 滚动栏的图片数量 */
@property(nonatomic) NSInteger newsPicNumber;
/** 滚动展示栏的图片 */
- (NSURL *)iconURLForRowInNewsPic:(NSInteger)row;
/** 滚动展示栏的文字 */
- (NSString *)titleForRowInNewsPic:(NSInteger)row;
/** 获取滚动栏的链接 */
- (NSString *)detailURLForRowInNewsPic:(NSInteger)row;



@end
