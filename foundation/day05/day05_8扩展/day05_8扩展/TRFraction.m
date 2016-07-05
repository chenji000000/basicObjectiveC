//
//  TRFraction.m
//  day05_8扩展
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRFraction.h"
#import "TRFraction_exam.h"

//定义私有的属性和方法
@interface TRFraction ()//扩展
@property int value;//私有的
-(void)method2;//私有的
@end

@implementation TRFraction
-(void)show
{
    NSLog(@"%d/%d",self.n,self.d);
}
-(void)extensionMethod0//扩展中声明的方法只能在主类的.m文件中实现，不能分开
{
    NSLog(@"method0被执行了");
}
-(void)method2
{
    NSLog(@"method2被执行了");
}

@end
