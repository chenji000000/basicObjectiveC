//
//  ViewController.m
//  Demo01-WebView
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDataDelegate>
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

//task
@property(nonatomic,strong) NSURLSessionDataTask *task;
//session
@property(nonatomic,strong) NSURLSession *session;
//filePath
@property(nonatomic,strong) NSString *filePath;
//可变数据类型
@property(nonatomic,strong)NSMutableData *filedata;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)startDownloadBigImage:(id)sender {
    //初始化可变数据
    self.filedata=[NSMutableData data];
    //url/request
    NSURL *url=[NSURL URLWithString:@"http://images.apple.com/v/iphone-5s/gallery/a/images/download/photo_1.jpg"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    //session(和configuration结合)
    /*default:所有缓存文件存储到磁盘
     ephemeral（临时的）：所有缓存文件存储到内存
     background：启动一个后台线程执行任务
     */
    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
    //第三个参数：nil(非主队列/子线程)；[NSOperationQueue mainQueue](主线程)
    self.session=[NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    //task
    self.task=[self.session dataTaskWithRequest:request];
    //resume
    [self.task resume];
}

#pragma mark---NSURLSessionDataDelegate
//调用多次；每次data长度不一样（一段一段陆续返回）
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data{
    NSLog(@"已经接受到数据:%@",[NSThread currentThread]);
    NSLog(@"data长度:%lu",(unsigned long)data.length);
    [self.filedata appendData:data];
    //回到主线程更新进度和imageView
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.progress=dataTask.countOfBytesReceived*1.0/dataTask.countOfBytesExpectedToReceive;
        self.imageView.image=[UIImage imageWithData:self.filedata];
    });
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    NSLog(@"图片已经下载完毕:%@",[NSThread currentThread]);
    //整个文件中/Library/Caches/test
    NSString *cachesPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath=[cachesPath stringByAppendingPathComponent:@"test"];
    [self.filedata writeToFile:filePath atomically:YES];
}


@end
