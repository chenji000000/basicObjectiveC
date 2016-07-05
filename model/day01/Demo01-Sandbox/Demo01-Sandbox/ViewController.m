//
//  ViewController.m
//  Demo01-Sandbox
//
//  Created by tarena on 15/11/5.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.获取沙盒根目录Folder
    NSString *homePath=NSHomeDirectory();
    NSLog(@"沙盒的根目录:%@",homePath);
    //2.获取沙盒数据容器的Documents目录
    /*第一个参数：指定要搜索的目录
     第二个参数：指定搜索域(当前登录用户下面)
     第三个参数：YES(绝对路径)；NO(非绝对路径)
     YES:/User/tarena/xxx/xxx
     NO:~/xxx/xxx
     返回：数组（iOS沙盒只会有一个目录）
     
     */
    
    NSString *documentsPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"Documents路径:%@",documentsPath);
    //3.获取沙盒数据容器的Library目录
    NSString *libraryPath=[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"Library路径:%@",libraryPath);
    //4.获取沙盒数据容器的tmp目录
    NSString *tmpPath=NSTemporaryDirectory();
    NSLog(@"tmp路径:%@",tmpPath);
    
    //5.获取bundle容器中的图片test.png(xxx.app)
    NSString *testPath=[[NSBundle mainBundle] pathForResource:@"test" ofType:@"png"];
    NSLog(@"test图片的路径:%@",testPath);
    //5.1方式二
    NSString *testPathStr=[[NSBundle mainBundle] pathForResource:@"test.png" ofType:nil];
    //设置UIImageView的image属性
    
    
    
    
    
    
    
    
    
    
}



@end
