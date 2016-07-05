//
//  main.m
//  day04_6
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRDog.h"
#import "TRCat.h"

void test()
{
    TRAnimal *ani=[[TRDog alloc] initWithName:@"阿黄" andAge:3];//（多态第一点）让父类的指针指向子类的对象
    [ani eat];//（多态第二点）用父类指针调用子类中重写的方法
    [ani sleep];
    //[ani watchHome];//（（多态第三点）父类指针只能访问父类原有的方法，不能访问子类新增加的）父类的指针不能调用子类自己添加的方法
     ani=[[TRCat alloc] initWithName:@"可可" andAge:1];
    [ani eat];
    [ani sleep];
}

void show(TRAnimal *a)//参数多态
{
    [a eat];
}

void test2()
{
    TRDog *dog=[[TRDog alloc] initWithName:@"旺财" andAge:4];
    show(dog);
    show([[TRCat alloc] initWithName:@"可可" andAge:2]);
}

void test3()//数组多态
{
    TRAnimal *ani[3];
    ani[0]=[[TRAnimal alloc] init];
    ani[1]=[[TRDog alloc] initWithName:@"旺财" andAge:4];
    ani[2]=[[TRCat alloc] initWithName:@"可可" andAge:2];
    for(int i=0;i<3;i++)
    {
        [ani[i] eat];
    }
}

typedef enum
{
ANIMAL,DOG,CAT,
}ANIMALS;

TRAnimal* test4(ANIMALS type)//返回值多态
{
switch(type)
    {
        case ANIMAL:
            return [[TRAnimal alloc] init];
        case DOG:
            return [[TRDog alloc] initWithName:@"旺财" andAge:4];
        case CAT:
            return [[TRCat alloc] initWithName:@"可可" andAge:2];
    
    }
    return nil;
}

void test5()
{
    TRAnimal* ani=test4(DOG);
    [ani eat];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        test();
//        test2();
//        test3();
        test5();
        
    }
    return 0;
}
