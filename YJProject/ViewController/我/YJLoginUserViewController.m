//
//  YJLoginUserViewController.m
//  YJProject
//
//  Created by YangJian on 15/11/26.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "YJLoginUserViewController.h"
#import <BmobSDK/Bmob.h>

@interface YJLoginUserViewController ()
@property (weak, nonatomic) IBOutlet UITextField *loginUserName;

@end

@implementation YJLoginUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BmobUser *currenUser = [BmobUser getCurrentUser];
    self.loginUserName.text = currenUser.username;
    
}
- (IBAction)clickOut:(id)sender {
    [self.storyboard instantiateViewControllerWithIdentifier:@"loginVC"];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
