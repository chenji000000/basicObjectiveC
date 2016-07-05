//
//  Product.h
//  Demo04_搜索框
//
//  Created by xiaoz on 15/9/30.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ProductType)
{
    ProductTypeDevice,
    ProductTypeSoftware,
    ProductTypeOther
};

@interface Product : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)ProductType type;

+(NSArray *)demoData;

@end








