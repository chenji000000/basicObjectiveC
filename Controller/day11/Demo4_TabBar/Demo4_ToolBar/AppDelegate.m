//
//  AppDelegate.m
//  Demo4_ToolBar
//
//  Created by tarena on 15/10/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds] ];
    
    UIViewController *vc1=[[UIViewController alloc] init];
    vc1.view.backgroundColor=[UIColor redColor];
    // 管理这个VC的外面的下面的那一条tabBar
    vc1.tabBarItem.title=@"第一个";
    vc1.tabBarItem.image=[UIImage imageNamed:@"line_bell"];
    vc1.tabBarItem.selectedImage=[UIImage imageNamed:@"full_bell"];
    
    UIViewController *vc2=[[UIViewController alloc] init];
    vc2.view.backgroundColor=[UIColor greenColor];
    vc2.tabBarItem.title=@"第二个";
    vc2.tabBarItem.image=[UIImage imageNamed:@"line_ball"];
    vc2.tabBarItem.selectedImage=[UIImage imageNamed:@"full_ball"];
    
    UIViewController *vc3=[[UIViewController alloc] init];
    vc3.view.backgroundColor=[UIColor whiteColor];
    vc3.tabBarItem.title=@"第三个";
    vc3.tabBarItem.image=[UIImage imageNamed:@"line_cart"];
    vc3.tabBarItem.selectedImage=[UIImage imageNamed:@"full_cart"];
    //设置tab项中的右上角徽章的数值
    vc3.tabBarItem.badgeValue=@"10";
    
    UITabBarController *tabVC=[[UITabBarController alloc] init];
    
    tabVC.tabBar.tintColor=[UIColor yellowColor];
    
//    tabVC.viewControllers=@[vc1,vc2,vc3];
    
    [tabVC addChildViewController:vc1];
    [tabVC addChildViewController:vc2];
    [tabVC addChildViewController:vc3];
    
    
    
    self.window.rootViewController=tabVC;
    
    [self.window makeKeyAndVisible];
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
