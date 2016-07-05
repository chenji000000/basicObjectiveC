//
//  TREmployee.h
//  day05_10员工管理程序
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TREmployee : NSObject
@property(nonatomic,copy) NSString* name;
@property(nonatomic,copy) NSString* job;
@property(nonatomic,assign) float salary;
-(void)print;

@end
