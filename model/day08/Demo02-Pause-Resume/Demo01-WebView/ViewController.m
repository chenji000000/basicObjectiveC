//
//  ViewController.m
//  Demo01-WebView
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDownloadDelegate
>
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
//task
@property(nonatomic,strong) NSURLSessionDownloadTask *task;
//session
@property(nonatomic,strong)NSURLSession *session;
//resumeData
@property(nonatomic,strong)NSData *resumeData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)startDownloadBigFile:(id)sender {
    //准备url
    NSURL *url=[NSURL URLWithString:@"http://localhost/TMD.pdf.zip"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    //session
    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
    self.session=[NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    //task
    self.task=[self.session downloadTaskWithRequest:request];
    //执行task
    [self.task resume];
}
//暂停
- (IBAction)pauseDownload:(id)sender {
    //防止多次点击按钮
    if (self.task==nil) {
        return;
    }
    [self.task cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        //resumeData:截止到点中暂停按钮瞬间，服务器返回的数据
        self.resumeData=resumeData;
//        NSLog(@"%@",[NSThread currentThread]);
        //设置task为nil
        self.task=nil;
    }];
}
//恢复
- (IBAction)resumeDownload:(id)sender {
    //防止恢复按钮多次点击
    if (self.resumeData==nil) {
        return;
    }
    //实际上执行一次新的发送任务的请求（从某个点之后开始下载）
    self.task=[self.session downloadTaskWithResumeData:self.resumeData];
    [self.task resume];//执行
    //设置resumeData为nil
    self.resumeData=nil;
}

#pragma mark---NSURLSessionDownloadDelegate
//已经下载完毕
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    //location：本地URL（tmp/）
    //location——>/Library/Caches/xxx
    NSString *cachesPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath=[cachesPath stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    NSError *error=nil;
    [[NSFileManager defaultManager] moveItemAtPath:location.path toPath:filePath error:&error];
    if (error) {
        NSLog(@"剪切失败:%@",error.userInfo);
    }
}
//调用多次；
/*bytesWritten:这一次服务器返回的数据的大小
 totalBytesWritten:截止到这一次服务器一共返回的数据大小
 totalBytesExpectedToWrite:请求的文件的总大小
 */
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    float progress=totalBytesWritten*1.0/totalBytesExpectedToWrite;
    //回到主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.progress=progress;
    });
}

@end
