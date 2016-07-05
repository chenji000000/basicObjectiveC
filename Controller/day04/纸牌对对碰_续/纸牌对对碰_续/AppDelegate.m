//
//  AppDelegate.m
//  纸牌对对碰_续
//
//  Created by tarena on 15/10/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "GameViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController=[[GameViewController alloc] initWithNibName:@"GameViewController" bundle:nil];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
