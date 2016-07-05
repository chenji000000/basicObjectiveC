//
//  ViewController.m
//  Demo03-GCD-Download
//
//  Created by tarena on 15/11/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)downloadImageByGCD:(id)sender {
    //全局队列+异步执行
    dispatch_queue_t queue=dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        //下载图片（子线程）
        //方式一：NSString ->NSURL->NSData->UIImage
        NSString *imageStr=@"http://www.egouz.com/uploadfile/2015/0305/20150305103702476.jpg";
        NSURL *imageURL=[NSURL URLWithString:imageStr];
        //真正下载图片（耗时操作）
        NSData *imageData=[NSData dataWithContentsOfURL:imageURL];
        UIImage *image=[UIImage imageWithData:imageData];
        //显示已经下载好的图片
        if (imageData!=nil) {
//            self.imageView.image=image;
            //回到主线程将image赋值给imageView(原因：使得任务优先级最高)
            dispatch_async(dispatch_get_main_queue(), ^{
                //主线程做赋值操作
                self.imageView.image=image;
            });
            //方式二：回到主线程(频率没有方式一高)
//            [self performSelectorOnMainThread:@selector(showImage:) withObject:image waitUntilDone:YES];
        }
    });
    NSLog(@"下载完毕");

}

-(void)showImage:(UIImage *)image{
//主线程（[NSThread currentThread]）
    self.imageView.image=image;
}



@end
