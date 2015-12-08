//
//  VideoCell.m
//  YJProject
//
//  Created by YangJian on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@implementation VideoCell

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:18];
    }
    return _titleLb;
}

- (UILabel *)descLb {
    if(_descLb == nil) {
        _descLb = [[UILabel alloc] init];
        _descLb.font = [UIFont systemFontOfSize:14];
        _descLb.textColor = [UIColor lightGrayColor];
        _descLb.numberOfLines = 0;
    }
    return _descLb;
}

- (UIButton *)iconBtn {
    if(_iconBtn == nil) {
        _iconBtn = [[UIButton alloc] init];
        [_iconBtn addTarget:self action:@selector(playVideo:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _iconBtn;
}

- (NSURL *)videoURL {
    if(_videoURL == nil) {
        _videoURL = [[NSURL alloc] init];
    }
    return _videoURL;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.descLb];
        [self.contentView addSubview:self.iconBtn];
        
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_lessThanOrEqualTo(20);
        }];
        
        [self.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(10);
        }];
        
        [self.iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(10);
            make.top.mas_equalTo(_descLb.mas_bottom).mas_equalTo(10);
        }];
    }
    return self;
}

//保证只有一个视频播放器
+ (AVPlayerViewController *)sharedInstance
{
    static AVPlayerViewController *vc = nil;
    static dispatch_once_t onceToKen;
    dispatch_once(&onceToKen, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}
/** 点击触发播放 */
- (void)playVideo:(UIButton *)sender
{
    AVPlayer *player = [AVPlayer playerWithURL:self.videoURL];
    [player play];
    [VideoCell sharedInstance].player = player;
    [sender addSubview:[VideoCell sharedInstance].view];
    [[VideoCell sharedInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

/** 防止Cell的复用 */
- (void)prepareForReuse
{
    [super prepareForReuse];
    if ([VideoCell sharedInstance].view.superview == self.iconBtn) {
        [[VideoCell sharedInstance].view removeFromSuperview];
        [VideoCell sharedInstance].player = nil;
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
