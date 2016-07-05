//
//  main.m
//  day04_1
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRDog.h"
#import "TRCat.h"
#import "TRPet.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRDog *dog=[[TRDog alloc]init];
        dog.name=@"旺财";
        dog.age=3;
        dog.weight=10;
        [dog eat];
        [dog sleep];
        [dog watchHome];
        
        TRCat *cat=[[TRCat alloc]init];
        cat.name=@"可可";
        cat.age=1;
        [cat eat];
        [cat sleep];
        [cat catchMouse];
        
        TRPet *pet=[[TRPet alloc]
                    initWithName:@"招财" andAge:2 andWeight:1];
        [pet eat];
        [pet bark];
    }
    return 0;
}
