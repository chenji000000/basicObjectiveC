//
//  TRStudent.h
//  day06_5
//
//  Created by student on 15-9-23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBook.h"

@interface TRStudent : NSObject
@property(assign) int age;//property属性参数默认是assign
@property(copy) TRBook* book;//这里写了copy后主函数内就不用写[对象名 copy];
-(id)initWithAge:(int)age andBook:(TRBook*)book;
-(void)study;
@end
