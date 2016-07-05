//
//  TRTeacher.h
//  day07_2
//
//  Created by student on 15-9-24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRTeacher : NSObject<NSCopying>
@property NSString* name;
@property NSString* course;
-(id)initWithName:(NSString*)name andCourse:(NSString*)course;
-(void)teaching;

@end
