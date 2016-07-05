//
//  ViewController.m
//  Demo05-GCD-Once
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
  //使用带snippet的快捷键
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        //
//    });
    
    for (int i=0; i<10; i++) {
        NSLog(@"进入for循环,执行次数:%d",i);
        
        //创建一个静态的一次性任务对象
        static dispatch_once_t onceToken;
        //执行一次性任务
        dispatch_once(&onceToken, ^{
            //只运行一次且仅一次
            NSLog(@"====只运行一次====");
        });
    }
    
}



@end
