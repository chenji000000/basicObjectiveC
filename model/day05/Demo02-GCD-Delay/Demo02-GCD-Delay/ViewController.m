//
//  ViewController.m
//  Demo02-GCD-Delay
//
//  Created by tarena on 15/11/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)dalayTaskByPerform:(id)sender {
    //调用perform延迟方法(5s)
    [self performSelector:@selector(excuteTask) withObject:nil afterDelay:5];
    //实现延迟的任务逻辑
    NSLog(@"执行完毕");
}
-(void)excuteTask{
//主线程
    for (int i=0; i<10; i++) {
        //阻塞主线程
        [NSThread sleepForTimeInterval:1];
        NSLog(@"++++++%@",[NSThread currentThread]);
    }
}

- (IBAction)delayTaskByGCD:(id)sender {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //主线程执行
        NSLog(@"延迟任务");
    });
    NSLog(@"延迟任务执行完毕");
}












@end
