//
//  TRStudent.m
//  day01_9
//
//  Created by student on 15-9-17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(void)setName:(NSString *)name
{
    _name=name;
}
-(NSString *)getName
{
    return _name;
}
-(void)setID:(int)ID
{
    _ID=ID;
}
-(int)getID
{
    return _ID;
}
-(void)setAddress:(NSString *)address
{
    _address=address;
}
-(NSString *)getAddress
{
    return _address;
}
-(void)setCScore:(double)CScore
{
    _CScore=CScore;
}
-(double)getCScore
{
    return _CScore;
}
-(void)show
{
    NSLog(@"姓名:%@,学号:%d,家庭住址:%@,语言成绩:%g",_name,_ID,_address,_CScore);
}




@end
