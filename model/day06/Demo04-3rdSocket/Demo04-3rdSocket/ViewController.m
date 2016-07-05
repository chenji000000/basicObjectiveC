//
//  ViewController.m
//  Demo04-3rdSocket
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "GCDAsyncSocket.h"

@interface ViewController ()<GCDAsyncSocketDelegate>
@property (weak, nonatomic) IBOutlet UITextView *showDataTextView;
@property (weak, nonatomic) IBOutlet UITextField *hostIPTextField;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;
//socket对象
@property(nonatomic,strong) GCDAsyncSocket *asyncSocket;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)connetToHost:(id)sender {
    if (self.hostIPTextField.text.length==0) {
        //保证IP不为空
        return;
    }
    
    //创建Socket对象
    self.asyncSocket=[[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    //连接到主机（ip+port）
    uint16_t port=1026;
    NSError *error=nil;
    if(![self.asyncSocket connectToHost:self.hostIPTextField.text onPort:port withTimeout:5 error:&error]){
        NSLog(@"连接主机失败:%@",error.userInfo);
        return;
    }
    //发送iam:xxx消息发送给服务器（模拟用户登录）
    NSString *messageStr=@"iam:chenji";
    [self.asyncSocket writeData:[messageStr dataUsingEncoding:NSUTF8StringEncoding] withTimeout:5 tag:0];
}



- (IBAction)sendMessage:(id)sender {
    //msg:xxxx给服务器
    NSString *msgStr=[NSString stringWithFormat:@"msg:%@",self.messageTextField.text];
    [self.asyncSocket writeData:[msgStr dataUsingEncoding:NSUTF8StringEncoding] withTimeout:5 tag:0];
}

#pragma mark---GCDAsyncSocketDelegate
-(void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port{
//已经连接到主机（已经做好接收来自服务器的数据）
    [self.asyncSocket readDataWithTimeout:-1 tag:0];
}

//从客服端发送
-(void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag{
    NSLog(@"已经发送成功");
}

//接收服务器端的数据
-(void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSString *dataFromHost=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    self.showDataTextView.text=dataFromHost;
    
    //已经做好接收服务器的准备
    [self.asyncSocket readDataWithTimeout:-1 tag:0];
}




@end
