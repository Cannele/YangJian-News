//
//  YJRankListCell.h
//  YJProject
//
//  Created by YangJian on 15/12/1.
//  Copyright © 2015年 YangJian. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface YJRankListCell : UITableViewCell

/** 序号标签 */
@property(nonatomic,strong) UILabel *orderLb;
/** 类型图片 */
@property(nonatomic,strong) YJImageView *iconIV;
/** 类型名称 */
@property(nonatomic,strong) UILabel *titleLb;
/** 类型描述 */
@property(nonatomic,strong) UILabel *descLb;
/** 集数 */
@property(nonatomic,strong) UILabel *numberLb;
/** 集数图标 */
@property(nonatomic,strong) YJImageView *numberIV;

@end
