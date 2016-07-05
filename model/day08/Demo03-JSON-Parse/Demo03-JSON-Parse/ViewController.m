//
//  ViewController.m
//  Demo03-JSON-Parse
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //从test.json获取JSON数据
    NSString *testPath=[[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
    //NSData接收
    NSData *data=[[NSData alloc] initWithContentsOfFile:testPath];
    //解析JSON数据
    //a.NSData->JSON对象（原则：最外层大括号使用NSDictionary；最外层中括号使用NSArray）
    NSError *error=nil;
    NSDictionary *testDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    //b.从JSON对象（testDic）获取value
    //体感温度
    NSString *feelsTemp=testDic[@"FeelsLikeC"];
    //当前温度
    NSNumber *temp=testDic[@"temp_c"];
    //请求城市
    NSArray *requestArray=testDic[@"request"];
    NSDictionary *queryDic=requestArray[0];
    NSString *queryStr=queryDic[@"query"];
    //经纬度
    NSString *latlonStr=requestArray[1][@"lat_lon"];
    //打印验证
    NSLog(@"体感温度:%@;预测温度:%@;城市名字:%@;经纬度:%@",feelsTemp,temp,queryStr,latlonStr);
    
    
    
    
    
    
    
}


@end
