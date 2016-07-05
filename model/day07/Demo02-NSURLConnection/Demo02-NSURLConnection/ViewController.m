//
//  ViewController.m
//  Demo02-NSURLConnection
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

@property(nonatomic,strong)NSURL *url;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)sendSyncRequest:(id)sender {
    self.url=[NSURL URLWithString:self.urlTextField.text];
    NSURLRequest *request=[NSURLRequest requestWithURL:self.url];
    NSError *error=nil;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if (!error) {
        //成功返回
        NSString *documentsPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        [self.webView loadData:data MIMEType:@"text/html" textEncodingName:@"utf-8" baseURL:[NSURL fileURLWithPath:documentsPath]];
    }
    NSLog(@"加载完毕");
}

- (IBAction)sendAsyncRequest:(id)sender {
    //1.创建NSURL
    self.url=[NSURL URLWithString:self.urlTextField.text];
    //2.创建NSURLRequest
    NSURLRequest *request=[NSURLRequest requestWithURL:self.url];
    //3.发送异步请求（NSURLConnection）
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //主线程执行
        //从response对象中获取状态码（200：OK）
        NSInteger statusCode=[(NSHTTPURLResponse *)response statusCode];
        //返回成功
        if (statusCode==200) {
            //加载服务器返回的数据data到webView
            NSString *documentsPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
            //本地沙盒Documents的url
            NSURL *htmlURL=[NSURL fileURLWithPath:documentsPath];
            [self.webView loadData:data MIMEType:@"text/html" textEncodingName:@"utf-8" baseURL:htmlURL];
        }else{
            NSLog(@"加载失败:%@",connectionError.userInfo);
        }
    }];
    NSLog(@"=============");
}












@end
