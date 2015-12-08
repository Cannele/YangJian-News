//
//  YJMeViewController.m
//  YJProject
//
//  Created by YangJian on 15/11/21.
//  Copyright © 2015年 yangjian. All rights reserved.
//

#import "YJMeViewController.h"
#import <BmobSDK/Bmob.h>
#import "YJLoginUserViewController.h"
@interface YJMeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *userPasswdText;

@end

@implementation YJMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *imageN = [UIImage imageNamed:@"icon"];
    UIImageView *leftVN = [[UIImageView alloc]initWithImage:imageN];
    leftVN.contentMode = UIViewContentModeCenter;
    leftVN.frame = CGRectMake(0, 0, 55, 20);
    self.userNameText.leftViewMode = UITextFieldViewModeAlways;
    self.userNameText.leftView = leftVN;
    
    UIImage *imageP = [UIImage imageNamed:@"lock"];
    UIImageView *leftVP = [[UIImageView alloc]initWithImage:imageP];
    leftVP.contentMode = UIViewContentModeCenter;
    leftVP.frame = CGRectMake(0, 0, 55, 20);
    self.userPasswdText.leftViewMode = UITextFieldViewModeAlways;
    self.userPasswdText.leftView = leftVP;
}

/** 点击登录 */
- (IBAction)clickLogin:(id)sender {
    
    [BmobUser loginWithUsernameInBackground:self.userNameText.text password:self.userPasswdText.text block:^(BmobUser *user, NSError *error) {
        if (error) {
            UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"登录失败" message:@"请输入正确的用户名和密码！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alter show];
        }else{
            NSLog(@"登录成功");
            //登录成功后
            YJLoginUserViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"userVC"];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }];    
    [self.view endEditing:YES];
}

/** 点击空白处收起键盘 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
