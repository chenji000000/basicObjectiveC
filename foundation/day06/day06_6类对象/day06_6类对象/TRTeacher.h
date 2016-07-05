//
//  TRTeacher.h
//  day06_6类对象
//
//  Created by student on 15-9-23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRTeacher : NSObject
@property NSString* name;
@property NSString* course;
-(id)initWithName:(NSString*)name andCourse:(NSString*)course;

@end
