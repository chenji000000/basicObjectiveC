//
//  Deal.m
//  Demo02-JSON-Part
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "Deal.h"

@implementation Deal
+(id)parseDealWithJSON:(NSDictionary *)dealDic
{
    return [[self alloc] initWithJSON:dealDic];
}

-(id)initWithJSON:(NSDictionary *)dealDic{
    if (self=[super init]) {
        //id
        self.dealID=dealDic[@"deal_id"];
        //title
        self.title=dealDic[@"title"];
        //list
        self.listPrice=dealDic[@"list_price"];
        //current
        self.currentPrice=dealDic[@"current_price"];
    }
    return self;
}

@end
