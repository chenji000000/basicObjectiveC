//
//  TRTime.m
//  day02_1
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRTime.h"

@implementation TRTime
-(void)setHour:(int)hour andsetMinute:(int)minute andsetSecond:(int)second
{
    _hour=hour;
    _minute=minute;
    _second=second;
}
-(void)setHour:(int)hour
{
    _hour=hour;
}
-(int)getHour
{
    return _hour;
}
-(void)setMinute:(int)minute
{
    _minute=minute;
}
-(int)getMinute
{
    return _minute;
}
-(void)setSecond:(int)second
{
    _second=second;
}
-(int)getSecond
{
    return _second;
}
-(void)show
{
    NSLog(@"%d时:%d分:%d秒",_hour,_minute,_second);
}
-(int)seconds//不在.h文件中声明，直接定义，则该函数为私有函数
{
    return _hour*60*60+_minute*60+_second;
}
-(void)printSeconds
{
    NSLog(@"总秒数:%d",[self seconds]);
}


@end
