//
//  VideoCell.h
//  YJProject
//
//  Created by YangJian on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface VideoCell : UITableViewCell

@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *descLb;
@property (nonatomic,strong) UIButton *iconBtn;
@property(nonatomic,strong) NSURL *videoURL;


@end
