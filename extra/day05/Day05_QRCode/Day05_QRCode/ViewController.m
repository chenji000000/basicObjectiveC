//
//  ViewController.m
//  Day05_QRCode
//
//  Created by tarena on 15/12/18.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //二维码：实质上 就是字符串-->通过一定的规则-->转换为图片
    //1.准备一个字符串
    NSString *str = @"陈吉";
    //2.把字符串转为数据类型， NSData
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    //3.创建一个二维码 过滤器,Filter:过滤
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    //把data数据放入到过滤器中
    [filter setValue:data forKey:@"inputMessage"];
    //输出图片
    CIImage *ciImg = filter.outputImage;
    //ciimage-->uiimage
    UIImage *image = [UIImage imageWithCIImage:ciImg];
    _imageView.image = image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
