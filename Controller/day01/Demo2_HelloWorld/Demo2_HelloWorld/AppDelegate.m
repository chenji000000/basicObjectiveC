//
//  AppDelegate.m
//  Demo2_HelloWorld
//
//  Created by tarena on 15/10/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //1.创建一个UIWindow对象（将window属性指向的对象创建好）
    UIScreen *screen=[UIScreen mainScreen];//屏幕对象
    
    self.window=[[UIWindow alloc] initWithFrame:screen.bounds];//将window对象的大小设置成屏幕一样大
   // 2.创建一个UIViewController对象，代表一个界面
    UIViewController *vc=[[UIViewController alloc] init];
    vc.view.backgroundColor=[UIColor whiteColor];
    //3.向刚创建好的界面中添加一些对象，比如按钮，标签...
    //3.1创建一个按钮对象
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    //3.2设置按钮的位置和大小
    button.frame=CGRectMake(20, 20, 200, 30);
    //3.3将按钮添加到界面上
    [vc.view addSubview:button];
    //3.5设置按钮上的文字
    [button setTitle:@"我是一个按钮" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor lightGrayColor];//将按钮的背景设置成亮灰色
    
    //创建对象
    UILabel *label =[[UILabel alloc] init];
    //设置属性
    label.text=@"我是一个标签";
    //设置位置和大小
    label.frame=CGRectMake(20, 60, 200, 30);
    //加入到视图中
    [vc.view addSubview:label];
    
    //4.将这个界面设置到window对象中，将window和controller关联起来
    self.window.rootViewController=vc;
    //5.显示window
    [self.window makeKeyAndVisible];
    return YES;
}

@end
