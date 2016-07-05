//
//  TRStudent.m
//  day09_4
//
//  Created by student on 15-9-29.
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
- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@,ID:%d", self.name,self.ID];
}
-(void)print:(id)condition
{

}

@end
