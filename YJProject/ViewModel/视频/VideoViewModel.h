//
//  VideoViewModel.h
//  YJProject
//
//  Created by YangJian on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideoNetManager.h"
@interface VideoViewModel : BaseViewModel
@property(nonatomic) NSInteger rowNumber;
@property(nonatomic) NSInteger index;

- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)descForRow:(NSInteger)row;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSURL *)videoURLForRow:(NSInteger)row;

@end
