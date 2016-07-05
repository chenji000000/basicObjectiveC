//
//  ViewController.m
//  TRSearchDeals
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "DPAPI.h"
#import "TRDeal.h"
#import "TRMetaDataTool.h"

@interface ViewController ()<DPRequestDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *categoryArray=[TRMetaDataTool categories];
    
    //url
    //参数（API文档：city）
    NSMutableDictionary *paramsDic=[NSMutableDictionary dictionary];
    //必须
    paramsDic[@"city"] = @"北京";
    //可选参数
    paramsDic[@"category"]=@"美食";
    paramsDic[@"region"]=@"朝阳区";
    paramsDic[@"sort"]=@2;
    //发送请求
    DPAPI *api=[[DPAPI alloc] init];
    [api requestWithURL:@"v1/deal/find_deals" params:paramsDic delegate:self];
}

- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result
{
    //解析服务器返回的result字典
    NSArray *resultArray=result[@"deals"];
    NSMutableArray *dealMutableArray=[NSMutableArray array];
    for (NSDictionary *dealDic in resultArray) {
        //1.创建一个空的模型对象
        TRDeal *deal=[[TRDeal alloc] init];
        //2.使用KVC方式进行解析
        [deal setValuesForKeysWithDictionary:dealDic];
        [dealMutableArray addObject:deal];
        
    }
    //dealMutableArray[TRDeal,TRDeal...];
}

- (void)request:(DPRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"返回失败:%@",error.userInfo);
}

@end
