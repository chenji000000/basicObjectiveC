//
//  TRStaff.h
//  day05_10员工管理程序
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TREmployee.h"

@interface TRStaff : TREmployee
-(id)initWithName:(NSString*)name andJob:(NSString*)job andSalary:(float)salary;
+(id)staffWithName:(NSString*)name andJob:(NSString*)job andSalary:(float)salary;

@end
