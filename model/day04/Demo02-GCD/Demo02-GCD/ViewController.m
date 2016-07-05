//
//  ViewController.m
//  Demo02-GCD
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
    
}

- (IBAction)SerialQueueSync:(id)sender {
    //1.创建串行队列
    dispatch_queue_t queue=dispatch_queue_create("FirstSerialQueue", DISPATCH_QUEUE_SERIAL);
    //2.提交任务到队列中（block）
    //3.同步执行任务
    dispatch_sync(queue, ^{
        //任务逻辑
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"++++++++++%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第一个打印完毕");
    //第二个任务
    dispatch_sync(queue, ^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"--------%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第二个打印完毕");
}

- (IBAction)SerialQueueAsync:(id)sender {
    dispatch_queue_t queue=dispatch_queue_create("SecondSerialQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"+++++++++%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第一个打印完毕");
    dispatch_async(queue, ^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"---------%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第二个打印完毕");
}
//几乎不用这种组合（串行队列+同步执行结果一样）
- (IBAction)concurrentQueueSync:(id)sender {
    dispatch_queue_t queue=dispatch_queue_create("FirstConcurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"++++++++%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第一个打印完毕");
    dispatch_sync(queue, ^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"--------%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第二个打印完毕");
}

- (IBAction)concurrentQueueAsync:(id)sender {
    dispatch_queue_t queue=dispatch_queue_create("SecondConcurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"++++++++%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第一个打印完毕");
    dispatch_async(queue, ^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"---------%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第二个打印完毕");
}
//和并行队列异步执行一模一样
- (IBAction)globalQueueAsync:(id)sender {
    //获取系统默认创建的全局队列(参数一：给定队列的优先级)
    dispatch_queue_t queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //提交任务到全局队列中
    dispatch_async(queue, ^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"++++++++%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第一个打印完毕");
    dispatch_async(queue, ^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"--------%@",[NSThread currentThread]
                  );
        }
    });
    NSLog(@"第二个打印完毕");
}

- (IBAction)mainQueueAsync:(id)sender {
    //注意：所有主队列中的任务都是由主线程完成
    //获取系统默认创建好的主队列
    dispatch_queue_t queue=dispatch_get_main_queue();
    //提交任务到主队列中
    dispatch_async(queue, ^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"++++++++%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第一个打印完毕");
    dispatch_async(queue, ^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"--------%@",[NSThread currentThread]);
        }
    });
    NSLog(@"第二个打印完毕");
}
//死锁问题（任务不要放到主队列中并且同步执行）
- (IBAction)mainQueueSync:(id)sender {
    //主队列同步执行
    NSLog(@"任务一");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"任务二");
    });
    NSLog(@"任务三");
}











@end
