//
//  TRPet.m
//  day04_1
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRPet.h"

@implementation TRPet
-(void)eat
{
    NSLog(@"宠物狗%@不吃东西",self.name);
}
-(void)bark
{
    for(int i=0;i<5;i++)
    {
        [super bark];//调用父类中的bark
        //[self bark];//调用子类中的bark
        
    }
}

@end
