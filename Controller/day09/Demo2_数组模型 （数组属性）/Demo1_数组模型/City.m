//
//  City.m
//  Demo1_数组模型
//
//  Created by tarena on 15/10/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "City.h"

@implementation City
+(NSArray *)demoData
{
    City *c1=[[City alloc] init];
    c1.name=@"北京";
    c1.population=1500;
    c1.subAreas=@[@"东城",@"西城",@"朝阳"];
    City *c2=[[City alloc] init];
    c2.name=@"上海";
    c2.population=1400;
    c2.subAreas=@[@"静安",@"徐汇",@"黄埔",@"浦东"];
    City *c3=[[City alloc] init];
    c3.name=@"广州";
    c3.population=1300;
    c3.subAreas=@[@"白云",@"天河"];
    return @[c1,c2,c3];

}
@end
