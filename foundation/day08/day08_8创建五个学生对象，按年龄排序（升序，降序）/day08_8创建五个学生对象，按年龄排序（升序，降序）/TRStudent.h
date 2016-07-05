//
//  TRStudent.h
//  day08_8创建五个学生对象，按年龄排序（升序，降序）
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject
@property(nonatomic,assign)int age;
@property(nonatomic,copy)NSString* name;
-(id)initWithAge:(int)age andName:(NSString*)name;
-(NSComparisonResult)compareAscending:(TRStudent*)otherStu;
-(NSComparisonResult)compareDescending:(TRStudent*)otherStu;

@end
