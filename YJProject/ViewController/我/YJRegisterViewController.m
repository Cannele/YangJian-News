//
//  YJRegisterViewController.m
//  YJProject
//
//  Created by YangJian on 15/11/26.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "YJRegisterViewController.h"
#import <BmobSDK/Bmob.h>
#import "YJMeViewController.h"
@interface YJRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *userPasswdText;

@end

@implementation YJRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)clickRegister:(id)sender {
    BmobUser *bUser = [[BmobUser alloc]init];
    [bUser setUsername:self.userNameText.text];
    [bUser setPassword:self.userPasswdText.text];
    [bUser signUpInBackgroundWithBlock:^(BOOL isSuccessful, NSError *error) {
        if (!isSuccessful) {
            if ([self.userNameText.text isEqualToString:@""] || [self.userPasswdText.text isEqualToString:@""]) {
                UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"注册失败" message:@"用户名和密码不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alter show];
            }else{
                UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"注册失败" message:@"用户名已存在，请重新输入！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alter show];
            }
        }else{
            //注册成功回到登录界面
        [self.storyboard instantiateViewControllerWithIdentifier:@"loginVC"];
            [self.navigationController popViewControllerAnimated:YES];
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
