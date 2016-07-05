//
//  TRTime.h
//  day02_1
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRTime : NSObject
{
    int _hour;
    int _minute;
    int _second;
}
-(void)setHour:(int)hour andsetMinute:(int)minute andsetSecond:(int)second;
-(int)getHour;
-(void)setMinute:(int)minute;
-(int)getMinute;
-(void)setSecond:(int)second;
-(int)getSecond;
-(void)show;
-(void)printSeconds;

@end
