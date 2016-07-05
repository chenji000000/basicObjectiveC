//
//  ViewController.m
//  Demo04-GCD-Group
//
//  Created by tarena on 15/11/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //全局队列+异步执行
    dispatch_queue_t queue=dispatch_get_global_queue(0, 0);
    //创建group对象
    dispatch_group_t group=dispatch_group_create();
    //将任务提到group中
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:5];
        NSLog(@"第一个图片下载完毕:%@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"第二个图片下载完毕:%@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"第三个图片下载完毕:%@",[NSThread currentThread]);
    });
    NSLog(@"...........");
    //通知group中的任务执行完了（合成图片/回到主线程）
    dispatch_group_notify(group, queue, ^{
        //三个图片已经全部下载完了(子线程)
        NSLog(@"三个图片下载完毕:%@",[NSThread currentThread]);
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"回到主线程更新界面");
        });
    });
    
}



@end
