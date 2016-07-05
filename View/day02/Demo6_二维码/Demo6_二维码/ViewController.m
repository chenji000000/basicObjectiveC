//
//  ViewController.m
//  Demo6_二维码
//
//  Created by tarena on 15/10/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CIFilter *filter=[CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    [filter setDefaults];
    
    //为二维码准备背后的二进制数据
    NSData *data=[@"http://www.baidu.com" dataUsingEncoding:NSUTF8StringEncoding];
    
    //使用KVC的方式将data赋给filter
    [filter setValue:data forKey:@"inputMessage"];
    
    //生成图片
    CIImage *outputImage=[filter outputImage];
    
    //将CIImage变成UIImage
    UIImage *qrImage=[UIImage imageWithCIImage:outputImage];
    self.ImageView.image=qrImage;
}



@end
