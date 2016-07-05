//
//  AppDelegate.m
//  BaseProject
//
//  Created by tarena on 15/12/15.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import <RESideMenu.h>
#import "LeftMenuViewController.h"
#import "RightMenuViewController.h"
#import "ViewController.h"

@interface AppDelegate ()
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
// 初始化方法
    [self initializeWithApplication:application];
    ViewController *vc = [[ViewController alloc] init];
    vc.view.backgroundColor = [UIColor purpleColor];
    
    LeftMenuViewController *left = [LeftMenuViewController new];
    RightMenuViewController *right = [RightMenuViewController new];
  //创建侧边栏
    RESideMenu *menu = [[RESideMenu alloc] initWithContentViewController:vc leftMenuViewController:left rightMenuViewController:right];
    self.window.rootViewController = menu;
    
    return YES;
}

@end





