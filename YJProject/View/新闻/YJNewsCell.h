//
//  YJNewsCell.h
//  YJProject
//
//  Created by YangJian on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface YJNewsCell : UITableViewCell
/** 左侧图片 */
@property(nonatomic,strong)UIImageView *iconIV;
/** 题目标签 */
@property(nonatomic,strong)UILabel *titleLb;
/** 回复数标签 */
@property(nonatomic,strong)UILabel *replyCountLb;
/** 更新时间 */
@property (nonatomic,strong) UILabel *updateTime;
@end
