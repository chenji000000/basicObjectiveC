//
//  CJNavigationController.m
//  我的微信
//
//  Created by tarena on 15/10/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CJNavigationController.h"

@interface CJNavigationController ()

@end

@implementation CJNavigationController

/*第一次使用这个类或这个类的子类的时候调用*/
+(void)initialize
{
    if (self==[CJNavigationController class]) {
        //保证只执行一次
        //1.获取导航栏外观实例
        UINavigationBar *bar=[UINavigationBar appearance];
        
        [bar setBackgroundImage:[UIImage imageNamed:@"navibg" ] forBarMetrics:UIBarMetricsDefault];
        [bar setBarStyle:UIBarStyleBlack];
        [bar setTintColor:[UIColor whiteColor]];
        NSMutableDictionary *attributes=[NSMutableDictionary dictionary];
        attributes[NSForegroundColorAttributeName]=[UIColor whiteColor];
        attributes[NSFontAttributeName]=[UIFont boldSystemFontOfSize:18];
        [bar setTitleTextAttributes:attributes];
        
    }

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   // NSLog(@"%s",__func__);
    
    //显示到导航控制器的第一个界面时，执行viewDidLoad
    //获取已经设置到导航上的选中后的图片
    //修改图片的渲染模式，为按照原始的样子进行渲染，再把新生成的图片赋值给selectedImage
    self.tabBarItem.selectedImage=[self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

}


@end
