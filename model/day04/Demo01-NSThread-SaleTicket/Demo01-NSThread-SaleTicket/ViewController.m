//
//  ViewController.m
//  Demo01-NSThread-SaleTicket
//
//  Created by tarena on 15/11/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//还剩多少张
@property(nonatomic,assign) int leftTicketCount;
//已经卖了多少张
@property(nonatomic,assign) int soldTicketCount;
//锁
@property(nonatomic,strong) NSLock *lock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}

- (IBAction)saleTicketByOneWindow:(id)sender {
    self.leftTicketCount=50;//总票数
    self.soldTicketCount=0;//初始化
    
    //创建NSThread对象
    NSThread *thread=[[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    thread.name=@"窗口一";
    //将卖票耗时的逻辑放到selector方法中
    //启动子线程
    [thread start];
}


-(void)saleTicket
{
    
    while (1) {
        //加锁
        [self.lock lock];
        //还有票
        if (self.leftTicketCount>0) {
            
            //开始卖票
            self.leftTicketCount--;
            self.soldTicketCount++;
            NSLog(@"窗口：%@;剩余：%d;卖出：%d",[NSThread currentThread],self.leftTicketCount,self.soldTicketCount);
            //解锁
            [self.lock unlock];
        }else{
        //没有票
            NSLog(@"票已经卖完");
            //解锁
            [self.lock unlock];
            break;
        }
    }

}

- (IBAction)saleTicketByTwoWindows:(id)sender {
    self.leftTicketCount=50;//总票数
    self.soldTicketCount=0;//初始化
    
    //初始化锁对象
    self.lock=[NSLock new];
    
    //创建两个NSThread对象
    NSThread *firstThread=[[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    firstThread.name=@"窗口一";
    NSThread *secondThread=[[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    secondThread.name=@"窗口二";
    //启动线程
    [firstThread start];
    [secondThread start];
}


















@end
