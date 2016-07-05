//
//  ViewController.m
//  Demo01-NSInvocationOperation
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
//non-main queue
- (IBAction)invocationSync:(id)sender {
    //1.创建非主队列
    //2.创建NSInvocationOperation对象
    NSInvocationOperation *operation=[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(printPlus) object:nil];
    //3.指定执行的任务(直接添加到主队列中执行；sync同步执行)
    [operation start];
}

- (IBAction)invocationAsync:(id)sender {
    //1.创建非主队列
    NSOperationQueue *queue=[[NSOperationQueue alloc] init];
    //2.创建NSInvocationOperation对象
    NSInvocationOperation *operation=[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(printPlus) object:nil];
    NSInvocationOperation *secondOperation=[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(printMinus) object:nil];
    //3.指定执行的任务(添加的瞬间就异步执行)
    [queue addOperation:operation];
    [queue addOperation:secondOperation];
    NSLog(@"执行完毕");
}

-(void)printMinus{
    for (int i=0; i<10; i++) {
        [NSThread sleepForTimeInterval:1];
        NSLog(@"---------%@",[NSThread currentThread]);
    }

}

-(void)printPlus{
    for (int i=0; i<10; i++) {
        [NSThread sleepForTimeInterval:1];
        NSLog(@"+++++++++%@",[NSThread currentThread]);
    }

}



@end
