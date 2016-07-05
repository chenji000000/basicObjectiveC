//
//  ViewController.m
//  Demo01-Singleton
//
//  Created by tarena on 15/11/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "TRDataCenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//需求：验证两个对象的地址是否一样
- (IBAction)unsafeSingleton:(id)sender {
    //创建两个线程（NSThread）
    NSThread *firstThread=[[NSThread alloc] initWithTarget:self selector:@selector(getUnsafeSingleton) object:nil];
    NSThread *secondThread=[[NSThread alloc] initWithTarget:self selector:@selector(getUnsafeSingleton) object:nil];
    //启动线程
    [firstThread start];
    [secondThread start];
}
-(void)getUnsafeSingleton
{
    TRDataCenter *dataCenter=[TRDataCenter sharedDataCenterByUnsafe];
    NSLog(@"线程不安全的单例对象地址:%p",dataCenter);
}

- (IBAction)safeSingleton:(id)sender {
    //创建两个线程对象
    NSThread *firstThread=[[NSThread alloc] initWithTarget:self selector:@selector(getSafeSingleton) object:nil];
    NSThread *secondThread=[[NSThread alloc] initWithTarget:self selector:@selector(getSafeSingleton) object:nil];
    //启动
    [firstThread start];
    [secondThread start];
}

-(void)getSafeSingleton{
    TRDataCenter *dataCenter=[TRDataCenter sharedDataCenterBySafe];
    NSLog(@"线程安全的单例对象地址:%p",dataCenter);

}

@end
