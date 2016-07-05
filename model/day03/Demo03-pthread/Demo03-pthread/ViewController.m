//
//  ViewController.m
//  Demo03-pthread
//
//  Created by tarena on 15/11/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)startTimingOperation:(id)sender {
    //for循环模拟耗时操作（主线程）
    for (int i=0; i<20000; i++) {
        NSLog(@"当前运行次数：%d",i);
    }
}

//<#void *(*)(void *)#>
//void *类型：函数可以返回任意类型的指针(无类型)
//void：函数没有返回值
//2.将耗时的操作给子线程做
void * task(void *data){
    printf("Number:%s",(char *)data);
//执行耗时操作（子线程）
    for (int i=0; i<20000; i++) {
        NSLog(@"执行次数：%d",i);
    }
    return 0;
}


- (IBAction)startTimingOperationByPthread:(id)sender {
    //需求：用户的滚动事件（任务）和打印事件（任务）同时执行（两个任务不影响）
    //1.创建一个子线程对象
    /*
     第二个参数：指定线程的一些属性（栈空间）（NULL：使用默认的属性）
     第三个参数：指向函数的指针（传参类型：void *;返回值类型：void *）
     第四个参数：传给task的参数
     */
    char *data="hello";
    pthread_t pthread;
    int threadError=pthread_create(&pthread, NULL, task, data);
    if (threadError!=0) {
        NSLog(@"无法创建子线程");
    }
   
}


@end
