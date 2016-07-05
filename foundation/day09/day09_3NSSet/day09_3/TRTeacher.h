//
//  TRTeacher.h
//  day09_3
//
//  Created by student on 15-9-29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRTeacher : NSObject
@property NSString* name;
@property NSString* course;
@property int ID;
-(id)initWithName:(NSString*)name andCourse:(NSString*)course andID:(int)ID;
@end
