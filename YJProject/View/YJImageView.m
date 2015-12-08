//
//  YJImageView.m
//  YJProject
//
//  Created by YangJian on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "YJImageView.h"

@implementation YJImageView

-(id)init
{
    if (self = [super init]) {
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        //按比例放大,充满
        _imageView.contentMode = 2;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(10);
        }];
        //当前视图容易减掉超出自身区域的视图
        self.clipsToBounds = YES;
    }
    return self;
}

@end
