//
//  ListenViewModel.h
//  YJProject
//
//  Created by YangJian on 15/12/1.
//  Copyright © 2015年 YangJian. All rights reserved.
//

#import "BaseViewModel.h"
#import "ListenNetManager.h"
@interface ListenViewModel : BaseViewModel

/** 数据的条数 */
@property(nonatomic) NSInteger rowNumber;
/** 某条数据的图片URL */
- (NSURL *)iconURLForRow:(NSInteger)row;
/** 某条数据的题目 */
- (NSString *)titleForRow:(NSInteger)row;
/** 某条数据的描述 */
- (NSString *)descForRow:(NSInteger)row;
/** 某条数据的集数 */
- (NSString *)numberForRow:(NSInteger)row;
/** 当前页数 */
@property(nonatomic) NSInteger pageId;
/** 当前页数对应的数据ID */
- (NSInteger)albumIdForRow:(NSInteger)row;

/** 当前最大页数 */
@property(nonatomic) NSInteger maxPageId;
/** 是否有更多页面 */
@property(nonatomic, getter=isHasMore) BOOL hasMore;

@end
