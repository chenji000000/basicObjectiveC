//
//  ViewController.m
//  Demo03-Block-Dependence
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

- (IBAction)setConcurrentCount:(id)sender {
    //创建非主队列
    NSOperationQueue *queue=[NSOperationQueue new];
    //设定同时执行任务的个数（起多少子线程）
    queue.maxConcurrentOperationCount=2;
    //创建任务
    NSBlockOperation *operation=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片111111%@",[NSThread currentThread]);
    }];
    NSBlockOperation *secondOperation=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片222222%@",[NSThread currentThread]);
    }];
    NSBlockOperation *thirdOperation=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片333333%@",[NSThread currentThread]);
    }];
    NSBlockOperation *fourthOperation=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片444444%@",[NSThread currentThread]);
    }];
    NSBlockOperation *fifthOperation=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片555555%@",[NSThread currentThread]);
    }];
    NSBlockOperation *sixthOperation=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片666666%@",[NSThread currentThread]);
    }];
    NSBlockOperation *seventhOperation=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片777777%@",[NSThread currentThread]);
    }];
    //执行任务（添加到非主队列）
    NSArray *array=@[operation,secondOperation,thirdOperation,fourthOperation,fifthOperation,sixthOperation,seventhOperation];
    [queue addOperations:array waitUntilFinished:YES];
}

- (IBAction)setDependence:(id)sender {
    //设定非主队列中的任务的依赖关系
    /*
     task1,task2,task3——>三个同时执行
     需求1：task1+task2——>task3
     task3 依赖 task1
     task3 依赖 task2
     需求：task2-->task1+task3
     task1 依赖 task2
     task3 依赖 task2
     */
    //1.创建非主队列
    NSOperationQueue *queue=[NSOperationQueue new];
    //2.创建操作（任务/子线程）
    NSBlockOperation *operation=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片111111");
    }];
    NSBlockOperation *secondOperation=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片222222");
        [NSThread sleepForTimeInterval:5];
    }];
    NSBlockOperation *thirdOperation=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片333333");
    }];
    //3.设定依赖关系
        [thirdOperation addDependency:operation];
        [thirdOperation addDependency:secondOperation];
    //4.执行
        [queue addOperation:operation];
        [queue addOperation:secondOperation];
        [queue addOperation:thirdOperation];
}

- (IBAction)returnMainThread:(id)sender {
    //方式三：回到主线程（有且仅有一个主队类）
    //非主队列
    NSOperationQueue *queue=[NSOperationQueue new];
    //添加任务（子线程）
    [queue addOperationWithBlock:^{
        NSLog(@"开始下载图片%@",[NSThread currentThread]);
        //回到主线程
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"显示/加载图片%@",[NSThread currentThread]);
        }];
    }];
    
}

@end
