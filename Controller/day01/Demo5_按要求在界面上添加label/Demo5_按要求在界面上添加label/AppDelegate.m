//
//  AppDelegate.m
//  Demo5_按要求在界面上添加label
//
//  Created by tarena on 15/10/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "MyViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController=[[MyViewController alloc] init];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
