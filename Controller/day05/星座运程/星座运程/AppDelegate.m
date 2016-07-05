//
//  AppDelegate.m
//  星座运程
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
    self.window.rootViewController=[[AViewController alloc] initWithNibName:@"AViewController" bundle:nil];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
