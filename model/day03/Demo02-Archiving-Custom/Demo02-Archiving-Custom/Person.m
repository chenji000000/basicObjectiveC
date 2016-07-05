//
//  Person.m
//  Demo02-Archiving-Custom
//
//  Created by tarena on 15/11/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)initWithName:(NSString *)name WithAge:(NSInteger)age
{

    if (self=[super init]) {
        //将传过来的名字和年龄赋值
        self.name=name;
        self.age=age;
    }
    return self;
}

#pragma mark ---NSCoding方法
//归档(编码)
-(void)encodeWithCoder:(NSCoder *)aCoder{
//对自定义类属性分别进行编码操作
    NSLog(@"开始对属性进行编码");
    //name编码
    [aCoder encodeObject:self.name forKey:@"name"];
    //age编码
    [aCoder encodeInteger:self.age forKey:@"age"];


}

//解档(解码)
-(id)initWithCoder:(NSCoder *)aDecoder{
    NSLog(@"对自定义类的属性进行解码");
    if (self=[super init]) {
        //name解码
        self.name=[aDecoder decodeObjectForKey:@"name"];
        //age解码
        self.age=[aDecoder decodeIntegerForKey:@"age"];
        
    }
    return self;
}



@end
