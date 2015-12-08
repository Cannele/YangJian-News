//
//  YJPicViewController.h
//  YJProject
//
//  Created by YangJian on 15/12/1.
//  Copyright © 2015年 YangJian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJPicViewController : UIViewController
- (id)initWithUrlStr:(NSString *)urlStr ;
@property (nonatomic,strong) NSString *urlStr;
@property (nonatomic,strong) NSNumber *infoType;
@end
