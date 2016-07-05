//
//  main.m
//  day08_2
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //获取世界标准时间
        NSDate *date=[NSDate date];
        NSLog(@"%@",date);//所有OC类的对象都可以用%@输出
        
        //获取本地时间
        NSTimeZone *zone=[NSTimeZone systemTimeZone];
        NSInteger interval=[zone secondsFromGMTForDate:date];//标准时间到当地时间的秒差
        NSDate *localDate=[date dateByAddingTimeInterval:interval];
        NSLog(@"%@",localDate);
        
        //获取比当前时间快30秒的世界标准时间
        NSDate *date2=[NSDate dateWithTimeIntervalSinceNow:30];
        NSLog(@"%@",date2);
        
        //获取自1970年1月1日0时到现在的总秒数
        NSTimeInterval seconds=[date timeIntervalSince1970];
        NSLog(@"%lf",seconds);
        //获取指定时间到现在的总秒数
        NSDate *time=[NSDate dateWithTimeIntervalSinceNow:-60];
        NSTimeInterval seconds1=[time timeIntervalSinceNow];
        NSLog(@"%lf",seconds1);
        
        //获取两个指定时间之间的总秒数
        NSDate *time1=[NSDate dateWithTimeIntervalSinceNow:-60*60*24];//获取24小时以前的时间
        NSDate *time2=[NSDate dateWithTimeIntervalSinceNow:60*60*24];
        NSTimeInterval seconds2=[time1 timeIntervalSinceDate:time2];
        NSLog(@"%lf",seconds2);
        
        //对比两个时间谁更早
        NSDate *earlierDate=[time1 earlierDate:time2];
        NSLog(@"%@",earlierDate);
        //谁更晚
        NSDate *laterDate=[time1 laterDate:time2];
        NSLog(@"%@",laterDate);
        //对比两个时间是否相同
        if([time1 isEqualToDate:time2]==YES)
        {
            NSLog(@"两个时间相同");
        }
        else
        {
            NSLog(@"两个时间不同");
        }
        
        
        //指定时间的输出格式
        NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
        formatter.dateFormat=@"yyyy年MM月dd日 hh:mm:ss";//属性指定时间格式
        NSString *strDate=[formatter stringFromDate:date];
        NSLog(@"%@",strDate);
        
    }
    return 0;
}
