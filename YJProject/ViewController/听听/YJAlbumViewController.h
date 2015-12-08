//
//  YJAlbumViewController.h
//  YJProject
//
//  Created by YangJian on 15/12/1.
//  Copyright © 2015年 YangJian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJAlbumViewController : UIViewController
- (instancetype)initWithAlbumId:(NSInteger)albumId;
@property (nonatomic) NSInteger albumId;
@end
