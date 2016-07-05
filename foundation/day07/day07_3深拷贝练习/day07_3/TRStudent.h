//
//  TRStudent.h
//  day07_3
//
//  Created by student on 15-9-24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject<NSCopying>
@property int age;
@property BOOL gender;
@property double salary;
-(id)initWithAge:(int)age andGender:(BOOL)gender andSalary:(double)salary;
-(void)printInfo;

@end
