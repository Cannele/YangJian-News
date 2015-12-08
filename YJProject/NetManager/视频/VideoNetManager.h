//
//  VideoNetManager.h
//  YJProject
//
//  Created by YangJian on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "VideoModel.h"
@interface VideoNetManager : BaseNetManager
+ (id)getVideoWithIndex:(NSInteger)index kCompletionHandle;
@end
