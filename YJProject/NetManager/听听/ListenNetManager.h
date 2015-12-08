//
//  ListenNetManager.h
//  YJProject
//
//  Created by YangJian on 15/12/1.
//  Copyright © 2015年 YangJian. All rights reserved.
//

#import "BaseNetManager.h"
#import "RankingListModel.h"
#import "AlbumModel.h"

@interface ListenNetManager : BaseNetManager

+ (id)getRankListWithPageId:(NSInteger)pageId kCompletionHandle;

+ (id)getAlbumWithId:(NSInteger)ID page:(NSInteger)pageId kCompletionHandle;

@end
