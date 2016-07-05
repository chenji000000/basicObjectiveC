//
//  AppDelegate.m
//  Demo2_Appearance
//
//  Created by tarena on 15/10/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //0.获取导航栏实例
    UINavigationBar *bar=[UINavigationBar appearance];
    //1.设置导航栏背景图
//    [bar setBackgroundImage:[UIImage imageNamed:@"NavigationBarDefault"] forBarMetrics:UIBarMetricsDefault];
    
    //2.设置背景色
    [bar setBarTintColor:[UIColor purpleColor]];
    
    //3.只有在有导航的情况下，如果需要修改状态栏的文字颜色，那么，只要设置导行栏的样式即可
    [bar setBarStyle:UIBarStyleBlack];
    
    //4.修改左右按钮的文字颜色
    [bar setTintColor:[UIColor whiteColor]];
    
    //5.设置返回按钮的箭头样式
    [bar setBackIndicatorImage:[UIImage imageNamed:@"back_btn"]];
    [bar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_btn"]];
    
    //6.设置标题栏的文字样式
    NSMutableDictionary *attributes=[NSMutableDictionary dictionary];
    attributes[NSFontAttributeName]=[UIFont boldSystemFontOfSize:18];
    attributes[NSForegroundColorAttributeName]=[UIColor yellowColor];
    
    
    [bar setTitleTextAttributes:attributes];
    
    //7.设置标题在竖直方向上的位置
    [bar setTitleVerticalPositionAdjustment:-10 forBarMetrics:UIBarMetricsDefault];
    
//    [[UIButton appearance] setBackgroundColor:[UIColor redColor]];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
