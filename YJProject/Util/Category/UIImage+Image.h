//
//  UIImage+Image.h
//  生活最新鲜
//
//  Created by YangJian on 15/11/21.
//  Copyright © 2015年 yangjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)
// instancetype默认会识别当前是哪个类或者对象调用，就会转换成对应的类的对象

//加载最原始的图，无渲染
+ (instancetype)imageWithOriginaName:(NSString *)name;
+ (instancetype)imageWithStretchableName:(NSString *)Name;
@end
