//
//  NewsDetailPageViewModel.h
//  YJProject
//
//  Created by YangJian on 15/11/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "NewsDetailPageModel.h"
@interface NewsDetailPageViewModel : BaseViewModel

@property (nonatomic,strong) NSString *detailPath;

- (NSString *)detailPageContent;

- (NSString *)detailPageTitle;

- (NSString *)detailPageDate;

- (void)getDetailPageCompleteHandle:(CompletionHandle)completionHandle;

@end
