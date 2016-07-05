//
//  Product.m
//  Demo04_搜索框
//
//  Created by xiaoz on 15/9/30.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import "Product.h"

@implementation Product

+ (NSArray *)demoData
{
    Product *p1 = [[Product alloc]init];
    p1.name = @"iPhone6";
    p1.type = ProductTypeDevice;
    
    Product *p2 = [[Product alloc]init];
    p2.name = @"iPhone6S";
    p2.type = ProductTypeDevice;
    
    Product *p3 = [[Product alloc]init];
    p3.name = @"iPhone6 Plus";
    p3.type = ProductTypeDevice;
    
    Product *p4 = [[Product alloc]init];
    p4.name = @"OS X EI Captain";
    p4.type = ProductTypeSoftware;
    
    Product *p5 = [[Product alloc]init];
    p5.name = @"AirPort Time Capsule";
    p5.type = ProductTypeOther;
    
    return @[p1,p2,p3,p4,p5];
}

@end








