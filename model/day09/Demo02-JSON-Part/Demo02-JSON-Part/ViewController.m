//
//  ViewController.m
//  Demo02-JSON-Part
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "Deal.h"
#import "DataManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取数据
    NSString *testPath=[[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
    NSData *testData=[NSData dataWithContentsOfFile:testPath];
    //NSData->JSON Object(NSArray/NSDictionary)
    NSDictionary *testDic=[NSJSONSerialization JSONObjectWithData:testData options:0 error:nil];
    //V2:使用DataManager来循环解析
    //dealsArray[Deal,Deal...]
    NSArray *dealsArray=[DataManager deals:testDic];
    
    
//    NSArray *dealsArray=testDic[@"deals"];
//    /*dealsArray[NSDictionary,NSDictionary....]
//      NSMutableArray[Deal,Deal...]
//     */
//    //声明一个可变数组
//    NSMutableArray *dealMutableArray=[NSMutableArray array];
//    for (NSDictionary *dealDic in dealsArray) {
//        //开始一个一个解析dealDic
//        Deal *deal=[Deal parseDealWithJSON:dealDic];
//        [dealMutableArray addObject:deal];
//    }
    
    //验证（dealMutableArray）
    for (Deal *deal in dealsArray) {
        NSLog(@"ID:%@; title:%@; list:%@; current:%@",deal.dealID,deal.title,deal.listPrice,deal.currentPrice);
    }
}



@end
