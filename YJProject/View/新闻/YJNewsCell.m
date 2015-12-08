//
//  YJNewsCell.m
//  YJProject
//
//  Created by YangJian on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "YJNewsCell.h"

@implementation YJNewsCell

- (UIImageView *)iconIV
{
    if (_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:17];
        _titleLb.numberOfLines = 0;
    }
    return _titleLb;
}

- (UILabel *)replyCountLb {
    if(_replyCountLb == nil) {
        _replyCountLb = [[UILabel alloc] init];
        _replyCountLb.textColor = [UIColor lightGrayColor];
        _replyCountLb.font = [UIFont systemFontOfSize:12];
    }
    return _replyCountLb;
}

- (UILabel *)updateTime
{
    if(_updateTime == nil) {
        _updateTime = [[UILabel alloc] init];
        _updateTime.textColor = [UIColor lightGrayColor];
        _updateTime.font = [UIFont systemFontOfSize:12];
    }
    return _updateTime;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.replyCountLb];
        [self.contentView addSubview:self.updateTime];
        
        //左侧图片：左 8 宽高 85*68
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(8);
            make.size.mas_equalTo(CGSizeMake(85, 60));
            make.centerY.mas_equalTo(0);
        }];
        
        //题目 距离图片的右 8 右 8 和图片同高
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(_iconIV.mas_topMargin);
        }];
        
        [self.updateTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(8);
            make.bottomMargin.mas_equalTo(_replyCountLb.mas_bottomMargin);
        }];
        
        [self.replyCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(_iconIV.mas_bottomMargin);
            make.rightMargin.mas_equalTo(_titleLb.mas_rightMargin);
        }];
    }
    return self;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
