//
//  ViewController.m
//  Demo04-NSThread
//
//  Created by tarena on 15/11/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//使用场景：创建线程和启动线程的逻辑分开（灵活性高）
- (IBAction)createThreadByInit:(id)sender {
    NSLog(@"create thread:%@",[NSThread currentThread]);
    //1.创建NSThread线程对象(selector指定子线程要执行的方法;object:传给selector方法的参数)
    NSThread *thread=[[NSThread alloc] initWithTarget:self selector:@selector(downloadTask:) object:@"传入参数"];
    //设置thread对象的名字
    thread.name=@"子线程";
    //2.指定线程对象执行耗时操作
    //3.手动启动该线程对象
    [thread start];
}

-(void)downloadTask:(NSString *)data
{
    //确定主线程还是子线程
    NSLog(@"thread:%@",[NSThread currentThread]);
//模拟耗时操作：在子线程中执行（一段执行逻辑）
    for (int i=0; i<20; i++) {
        NSLog(@"执行次数:%d",i);
    }
}

//适用场景：简单的在子线程中执行selector方法(无法指定线程的名字)
- (IBAction)createThreadByPerform:(id)sender {
    //自动的启动一个子线程，执行selector方法
    [self performSelectorInBackground:@selector(downloadTask:) withObject:nil];
}
//适用场景：简单的在子线程中执行selector方法（创建和启动没有分离）
- (IBAction)createThreadByDetach:(id)sender {
    //自动的创建子线程；并且自动启动该子线程
    [NSThread detachNewThreadSelector:@selector(downloadTask:) toTarget:self withObject:nil];
}













@end
