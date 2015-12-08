//
//  NewsModel.h
//  YJProject
//
//  Created by YangJian on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class NewsDataModel,Item,ItemLink;
@interface NewsModel : BaseModel


@property (nonatomic, strong) NSArray<NewsDataModel *> *data;


@end

@interface NewsDataModel : NSObject

@property (nonatomic, strong) NSArray<Item *> *item;

@property (nonatomic, assign) NSInteger expiredTime;

@property (nonatomic, copy) NSString *listId;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) NSInteger totalPage;

@end

@interface Item : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *documentId;

@property (nonatomic, copy) NSString *comments;

@property (nonatomic, strong) ItemLink *link;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *commentsall;

@property (nonatomic, copy) NSString *thumbnail;

@property (nonatomic, copy) NSString *online;

@property (nonatomic, copy) NSString *commentsUrl;

@property (nonatomic, copy) NSString *updateTime;

@end

@interface ItemLink : NSObject

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *url;

@end

