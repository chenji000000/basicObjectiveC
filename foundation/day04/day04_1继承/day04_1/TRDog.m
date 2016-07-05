//
//  TRDog.m
//  day04_1
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDog.h"

@implementation TRDog
-(id)initWithName:(NSString *)name andAge:(int)age andWeight:(int)weight
{
if(self=[super initWithName:name andAge:age])
{
    self.weight=weight;
}
    return self;
}
-(void)watchHome
{
    NSLog(@"狗狗%@正在看家",self.name);
}
-(void)eat//对基类中的方法进行重写
{
    NSLog(@"狗狗%@正在啃骨头",self.name);
}
-(void)bark
{
    NSLog(@"汪汪");
}

@end
