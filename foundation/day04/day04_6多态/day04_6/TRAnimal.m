//
//  TRAnimal.m
//  day04_6
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRAnimal.h"

@implementation TRAnimal
-(id)initWithName:(NSString *)name andAge:(int)age
{
if(self=[super init])
{
    self.name=name;
    self.age=age;
}
    return self;
}
-(void)eat
{
    NSLog(@"动物%@吃",self.name);
}
-(void)sleep
{
    NSLog(@"动物%@睡",self.name);
}

@end
