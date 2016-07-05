//
//  TRAnimal.m
//  day04_8
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRAnimal.h"

@implementation TRAnimal
-(id)initWithName:(NSString*)name
{
if(self=[super init])
{
    self.name=name;
}
    return self;
}
-(void)eat:(TRFood *)food
{
    NSLog(@"%@吃%@",self.name,food.name);
}

@end
