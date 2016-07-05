//
//  DataManager.m
//  Demo02-JSON-Part
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "DataManager.h"
#import "Deal.h"

@implementation DataManager
+(NSArray *)deals:(NSDictionary *)dealDic
{
    NSArray *dealsArray=dealDic[@"deals"];
    //循环解析
    NSMutableArray *dealsMutableArray=[NSMutableArray array];
    for (NSDictionary *dealDictionary in dealsArray) {
        Deal *deal=[Deal parseDealWithJSON:dealDictionary];
        [dealsMutableArray addObject:deal];
    }
    return [dealsMutableArray copy];
}

@end
