//
//  YJHtmlViewController.m
//  YJProject
//
//  Created by YangJian on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "YJHtmlViewController.h"
#import "NewsDetailPageViewModel.h"
@interface YJHtmlViewController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic,strong) NewsDetailPageViewModel *detailVM;
@end

@implementation YJHtmlViewController

- (id)initWithUrlStr:(NSString *)urlStr
{
    if (self = [super init]) {
        self.urlStr = urlStr;
    }
    return self;
}

- (NewsDetailPageViewModel *)detailVM {
    if(_detailVM == nil) {
        _detailVM = [[NewsDetailPageViewModel alloc] init];
    }
    return _detailVM;
}

- (UIWebView *)webView {
    if(_webView == nil) {
        _webView = [[UIWebView alloc] init];
       // [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
        _webView.delegate = self;
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    self.detailVM.detailPath = self.urlStr;
    [self.detailVM getDetailPageCompleteHandle:^(NSError *error) {
        [_webView loadHTMLString:[self.detailVM detailPageContent] baseURL:nil];
    }];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showProgress];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideProgress];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self hideProgress];
}



@end
