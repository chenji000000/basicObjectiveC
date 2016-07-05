//
//  ViewController.m
//  Demo02-NSBlockOperation
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)blockSync:(id)sender {
    //创建对象(方式一)
    NSBlockOperation *operation=[NSBlockOperation new];
    //添加任务
    [operation addExecutionBlock:^{
        NSLog(@"下载图片111111%@",[NSThread currentThread]);
    }];
    [operation addExecutionBlock:^{
        NSLog(@"下载图片222222%@",[NSThread currentThread]);
    }];
    [operation addExecutionBlock:^{
        NSLog(@"下载图片333333%@",[NSThread currentThread]);
    }];
    //执行任务（同步）
    //第一个操作由主线程做；剩余操作由子线程做
    [operation start];
}

- (IBAction)blockAsync:(id)sender {
    //1.创建一个非主队列
    NSOperationQueue *queue=[[NSOperationQueue alloc] init];
    //2.创建操作对象（方式二）
    NSBlockOperation *operation=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片111111%@",[NSThread currentThread]);
    }];
    NSBlockOperation *otherOperation=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片222222%@",[NSThread currentThread]);
    }];
    
    //3.执行操作（添加操作到非主队列）
    [queue addOperation:operation];
    [queue addOperation:otherOperation];
    NSLog(@"下载完毕");
}
















@end
