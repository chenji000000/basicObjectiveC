//
//  ViewController.m
//  Demo01-WebView
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)startDownloadImageByDataTask:(id)sender {
    //准备请求对象
    NSURL *url=[NSURL URLWithString:@"http://images.apple.com/v/iphone-5s/gallery/a/images/download/photo_1.jpg"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    //1.创建NSURLSession对象（单例）
    NSURLSession *session=[NSURLSession sharedSession];
    //2.创建NSURLSessionDataTask对象
    NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //子线程
        NSLog(@"下载完成%@",[NSThread currentThread]);
        //NSData->UIImage
        UIImage *image=[UIImage imageWithData:data];
        //回到主线程显示
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image=image;
        });
    }];
    //3.发送请求（执行数据任务）
    [task resume];
}

- (IBAction)startDownloadImageByDownloadTask:(id)sender {
    //准备请求对象
    NSURL *url=[NSURL URLWithString:@"http://images.apple.com/v/iphone-5s/gallery/a/images/download/photo_1.jpg"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    //1.创建NSURLSession对象（单例）
    NSURLSession *session=[NSURLSession sharedSession];
    //2.创建NSURLSessionDownloadTask对象
    NSURLSessionDownloadTask *task=[session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"下载完毕:%@",[NSThread currentThread]);
        NSLog(@"文件位置:%@",location);
        //将tmp下面的图片剪切到/Library/Caches/
        NSString *cachesPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        NSString *filePath=[cachesPath stringByAppendingPathComponent:response.suggestedFilename];
        NSError *fileError=nil;
        [[NSFileManager defaultManager] moveItemAtPath:location.path toPath:filePath error:&fileError];
        if (fileError) {
            NSLog(@"移除失败:%@",fileError);
        }
        
        //子线程；location是在沙盒中tmp目录下（定时不定时删除）
        //tmp下面的图片保存(内存)
        NSData *data=[NSData dataWithContentsOfFile:filePath];
        UIImage *image=[UIImage imageWithData:data];
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image=image;
        });
        
    }];
    //3.发送请求（执行下载任务）
    [task resume];
}

















@end
