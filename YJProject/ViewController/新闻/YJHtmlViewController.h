//
//  YJHtmlViewController.h
//  YJProject
//
//  Created by YangJian on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJHtmlViewController : UIViewController

- (id)initWithUrlStr:(NSString *)urlStr;
@property (nonatomic,strong) NSString *urlStr;
@end
