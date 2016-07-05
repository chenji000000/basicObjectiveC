//
//  ViewController.m
//  Demo01-WebView
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextFiled;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)sendRequest:(id)sender {
    //1.创建NSURL对象
    NSURL *url=[NSURL URLWithString:self.urlTextFiled.text];
    //2.创建NSURLRequest对象
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    //设置代理
    self.webView.delegate=self;
    //3.发送请求(方式一：和webView结合)
    [self.webView loadRequest:request];
}

#pragma mark---UIWebViewDelegate
//开始加载网页
-(void)webViewDidStartLoad:(UIWebView *)webView
{
//让状态条(status bar)的activityIndicatorView开始动画
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}
//成功加载完毕
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //设置状态indicatorView动画停止
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}
//加载失败
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //停止动画
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    NSLog(@"加载失败:%@",error.userInfo);
}
@end
