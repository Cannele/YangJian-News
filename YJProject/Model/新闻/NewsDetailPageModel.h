//
//  NewsDetailPageModel.h
//  YJProject
//
//  Created by YangJian on 15/11/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class DetailMeta,DetailBody,DetailImg,DetailSize;
@interface NewsDetailPageModel : BaseModel


@property (nonatomic, strong) DetailMeta *meta;

@property (nonatomic, strong) DetailBody *body;

@end
@interface DetailMeta : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *documentId;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, assign) NSInteger o;

@property (nonatomic, copy) NSString *classes;

@end

@interface DetailBody : NSObject

@property (nonatomic, copy) NSString *documentId;

@property (nonatomic, copy) NSString *thumbnail;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *programNo;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *wwwurl;

@property (nonatomic, copy) NSString *shareurl;

@property (nonatomic, strong) NSArray<DetailImg *> *img;

@property (nonatomic, copy) NSString *channel;

@property (nonatomic, copy) NSString *hasVideo;

@property (nonatomic, copy) NSString *commentType;

@property (nonatomic, copy) NSString *cate;

@property (nonatomic, copy) NSString *program;

@property (nonatomic, copy) NSString *commentCount;

@property (nonatomic, copy) NSString *editTime;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *introduction;

@property (nonatomic, copy) NSString *wapurl;

@property (nonatomic, copy) NSString *commentsUrl;

@property (nonatomic, copy) NSString *sologan;

@property (nonatomic, copy) NSString *editorcode;

@property (nonatomic, copy) NSString *author;

@end

@interface DetailImg : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, strong) DetailSize *size;

@end

@interface DetailSize : NSObject

@property (nonatomic, copy) NSString *width;

@property (nonatomic, copy) NSString *height;

@end

