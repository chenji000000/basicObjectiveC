//
//  AppDelegate.m
//  Demo2_导航控制器
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //创建第一个要展示的A界面
    AViewController *avc=[[AViewController alloc] initWithNibName:@"AViewController" bundle:nil];
    
    //创建导航控制器的实例
    UINavigationController *navi=[[UINavigationController alloc] initWithRootViewController:avc];
    
    //设置window的根视图控制器
    self.window.rootViewController=navi;
    
    //显示window
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
