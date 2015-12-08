//
//  YJPlayView.h
//  YJProject
//
//  Created by YangJian on 15/12/1.
//  Copyright © 2015年 YangJian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface YJPlayView : UIView

+ (YJPlayView *)sharedInstance;

- (void)playWithURL:(NSURL *)musicURL;

@property(nonatomic, strong) AVPlayer *player;
@property(nonatomic, strong) UIButton *playBtn;

@end
