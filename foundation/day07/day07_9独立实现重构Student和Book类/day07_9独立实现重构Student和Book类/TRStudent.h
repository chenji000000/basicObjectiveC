//
//  TRStudent.h
//  day07_9独立实现重构Student和Book类
//
//  Created by student on 15-9-24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject<NSCopying>
@property int age;
@property char gender;
@property double salary;
-(id)initWithAge:(int)age andGender:(char)gender andSalary:(double)salary;
-(void)printInfo;

@end
