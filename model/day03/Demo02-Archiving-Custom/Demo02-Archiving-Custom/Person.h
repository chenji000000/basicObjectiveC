//
//  Person.h
//  Demo02-Archiving-Custom
//
//  Created by tarena on 15/11/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
//name
@property(nonatomic,strong)NSString *name;
//age
@property(nonatomic,assign)NSInteger age;
//初始化的方法
-(id)initWithName:(NSString *)name WithAge:(NSInteger)age;

@end
