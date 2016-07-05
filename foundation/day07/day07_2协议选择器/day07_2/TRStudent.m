//
//  TRStudent.m
//  day07_2
//
//  Created by student on 15-9-24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(id)initWithName:(NSString *)name andID:(int)ID
{
if(self=[super init])
{
    self.name=name;
    self.ID=ID;
}
    return self;
}
-(void)study
{
    NSLog(@"学生%@正在学习",self.name);
}

@end
