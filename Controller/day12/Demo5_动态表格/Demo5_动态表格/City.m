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
    
    City *c2=[[City alloc] init];
    c2.name=@"上海";
    c2.population=1400;
    
    City *c3=[[City alloc] init];
    c3.name=@"广州";
    c3.population=1300;
    
    City *c4=[[City alloc] init];
    c4.name=@"武汉";
    c4.population=1200;
    
    City *c5=[[City alloc] init];
    c5.name=@"深圳";
    c5.population=1100;
    
    return @[c1,c2,c3,c4,c5];

}
@end
