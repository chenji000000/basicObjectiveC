//
//  ViewController.m
//  Demo01-AFNetworking
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)httpGetRequest:(id)sender {
    //1.创建操作管理对象
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    //2.执行get方法（发送请求）
    NSString *string=@"http://www.raywenderlich.com/demos/weather_sample/weather.php?format=json";
    [manager GET:string parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"请求成功:%@",responseObject);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"请求失败:%@",error.userInfo);
    }];
}

- (IBAction)httpPostRequest:(id)sender {
    //1.创建操作管理对象
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
    //2.创建可变字典（存储发送服务器参数）
    NSString *string=@"http://www.raywenderlich.com/demos/weather_sample/weather.php";
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[@"format"]=@"json";
    //3.执行post请求
    [manager POST:string parameters:dic success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"post请求成功:%@",responseObject);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"请求失败:%@",error.userInfo);
    }];
}










@end
