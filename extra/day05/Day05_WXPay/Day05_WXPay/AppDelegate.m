//
//  AppDelegate.m
//  Day05_WXPay
//
//  Created by tarena on 15/12/18.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "WXApi.h"
#import "WXApiObject.h"

/**
 *  微信支付：需要在微信官方申请，营业执照。。支付功能只能对企业开放，个人无法申请
 */

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //通过申请的appid注册授权
    [WXApi registerApp:@"在微信开放平台上申请的Appid"];
    
    /**
     *  支付按钮被点击以后的操作如下
     把支付的相关信息 存放到一个 对象中 ，然后拉起支付即可
     */
    PayReq *pay = [PayReq new];
    
    pay.partnerId = @"商家id,官网申请获得";
    pay.prepayId = @"订单id,服务器人员给 或者 根据一定的规则生成";
    pay.nonceStr = @"随机串，服务器人员给或者根据一定的规则生成";
    //通常情况下 时间戳,当前时间距离1970年秒数
    NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
    pay.timeStamp = timeStamp;
    pay.package = @"根据财付通文档填写的数据和签名，这个签名与开发无关，谁填写不一定，但大多数情况下，会由服务器人员传递给你";
    pay.sign = @"由服务器人员给";
    //拉起微信客户端，实现支付功能
    [WXApi sendReq:pay];
    
    
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
