//
//  ViewController.m
//  Day05_QRCode_Scan
//
//  Created by tarena on 15/12/18.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
//扫描二维码，需要系统库，AVFoundation支持
//1.到build phase +类库，然后使用#import <AVFoundation>
//ios7以后，引入系统类库，有快捷方式

@import AVFoundation;
/**
 *  扫描二维码流程
 1.打开后置摄像头
 2.从后置摄像头中读取数据输入流
 3.把输入流 输出到屏幕上展示-->输出流
 4.把输入流-->转移到 输出流。。中间需要一个管道-->会话
 5.让输出流（向屏幕显示）实时过滤自己的内容，监听是否有二维码/条形码存在，如果有，就通过协议通知我们
 */

@interface ViewController ()<AVCaptureMetadataOutputObjectsDelegate>

//管道--连接输出 输入流
@property (nonatomic, strong) AVCaptureSession *session;

//用于展示输出流到界面上的视图
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoLayer;

@end

@implementation ViewController
- (IBAction)scanCode:(id)sender {
    //获取后置摄像头的管理对象
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //从摄像头捕获输入流
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (error) {
        NSLog(@"error %@", error);
        return;
    }
    //创建输出流-->把图像输入到屏幕上显示
    AVCaptureMetadataOutput *output =  [AVCaptureMetadataOutput new];
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    //需要一个管道连接输入和输出
    _session = [AVCaptureSession new];
    [_session addInput:input];
    [_session addOutput:output];
    //管道可以规定质量，流畅/高清/标清
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
#warning 设置输出流监听 二维码/条形码，必须在管道接通知后设置！！！
    output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeEAN8Code];
    //把画面输入到屏幕上，给用户看
    _videoLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    _videoLayer.frame = self.view.frame;
    [self.view.layer addSublayer:_videoLayer];
    //启动管道
    [_session startRunning];
}

#pragma mark--当扫描到我们想要的数据时，触发
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
//metadataObjects数组中，存放的就是扫描出的数据
    if (metadataObjects.count > 0) {
        //如果扫描到，关闭管道，去掉扫描显示
        [_session stopRunning];
        [_videoLayer removeFromSuperlayer];
 //拿扫描到的数据
        AVMetadataMachineReadableCodeObject *obj = metadataObjects.firstObject;
        NSLog(@"扫描到的数据：%@", obj.stringValue);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
