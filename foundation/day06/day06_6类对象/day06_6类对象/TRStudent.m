//
//  TRStudent.m
//  day06_6类对象
//
//  Created by student on 15-9-23.
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

@end
