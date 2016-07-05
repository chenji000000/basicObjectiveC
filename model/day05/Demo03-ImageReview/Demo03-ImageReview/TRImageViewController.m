//
//  TRImageViewController.m
//  Demo03-ImageReview
//
//  Created by tarena on 15/11/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRImageViewController.h"
#import "TRImageCenter.h"

@interface TRImageViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)NSString *imageStr;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)TRImageCenter *imageCenter;
@end

@implementation TRImageViewController

-(id)initWithImageStr:(NSString *)imageStr
{
    if (self=[super init]) {
        self.imageStr=imageStr;
    }
    return self;
}

//-(void)dealloc
//{
//    NSLog(@"%s",__func__);
//}

- (void)viewDidLoad {
    [super viewDidLoad];
//     NSLog(@"%s",__func__);
    
    //V1:阻塞主线程
//    //开始下载图片
//    [self.activityView startAnimating];
//    //NSString->NSURL->NSData->UIImage
//    NSURL *imageURL=[NSURL URLWithString:self.imageStr];
//    NSData *imageData=[NSData dataWithContentsOfURL:imageURL];//耗时
//    UIImage *image=[UIImage imageWithData:imageData];
//    UIImageView *imageView=[[UIImageView alloc] initWithImage:image];
//    //停止动画
//    [self.activityView stopAnimating];
//    
//    //设置contentSize和图片大小一样
//    self.scrollView.contentSize=image.size;
//    
//    //添加到scrollView上
//    [self.scrollView addSubview:imageView];
    
    //初始化imageCenter的单例对象
    self.imageCenter=[TRImageCenter sharedImageCenter];
    
    
    //图片缓存原理
    //内存中（字典）是否有图片
    UIImage *image=self.imageCenter.cachesMutableDic[self.imageStr];
    if(image){
    //直接显示图片
        [self updateView:image];
    }else{
    //内存没有，取沙盒文件数据
        NSString *filePath=[self generateFilePath:self.imageStr];
        NSData *imageData=[NSData dataWithContentsOfFile:filePath];
        if(imageData){
        //直接显示图片
            [self updateView:[UIImage imageWithData:imageData]];
        }else{
        //内存没有，沙盒文件没有
            //开始下载图片
            [self startDownloadImage];
        }
    }
    
   
}

-(void)startDownloadImage
{
    //开始动画
    [self.activityView startAnimating];
    //全局队列
    dispatch_queue_t queue=dispatch_get_global_queue(0, 0);
    //提交一个下载任务
    dispatch_async(queue, ^{
        NSURL *imageURL=[NSURL URLWithString:self.imageStr];
        NSData *imageData=[NSData dataWithContentsOfURL:imageURL];
        UIImage *image=[UIImage imageWithData:imageData];
        
        if (imageData) {
            //将image存到字典中（子线程）
            self.imageCenter.cachesMutableDic[self.imageStr]=image;
            //将image存到沙盒中文件中
            NSString *filePath=[self generateFilePath:self.imageStr];
            [imageData writeToFile:filePath atomically:YES];
          //回到主线程  
            dispatch_async(dispatch_get_main_queue(), ^{
                //更新界面（UIKit framework）
                [self updateView:image];
            });
        }
    });

}

-(NSString *)generateFilePath:(NSString *)imageStr{
    //拼接存储的文件的绝对路径xxx/Library/Caches/photo_%d.jpg
    NSString *cachesPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    //imageStr:http://xxx/xxx/photo_3.jpg
    NSString *filePath=[cachesPath stringByAppendingPathComponent:[imageStr lastPathComponent] ];
    return filePath;
}

-(void)updateView:(UIImage *)image
{
    //主线程
    
    //设置delegate
    self.scrollView.delegate=self;
    //设置scrollView的最大最小倍数
    self.scrollView.maximumZoomScale=2.0;
    self.scrollView.minimumZoomScale=0.1;
    
    self.imageView=[[UIImageView alloc] initWithImage:image];
    //停止动画
    [self.activityView stopAnimating];
    
    self.scrollView.contentSize=image.size;
    [self.scrollView addSubview:self.imageView];
}

//点中取消item
- (IBAction)clickCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark---UIScrollViewDelegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    
    return self.imageView;
}

@end
