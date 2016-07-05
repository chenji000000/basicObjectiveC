//
//  TRStudent.h
//  day10_3
//
//  Created by tarena on 15/9/30.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject
@property NSString* name;
@property int age;
-(id)initWithName:(NSString*)name andAge:(int)age;

@end
