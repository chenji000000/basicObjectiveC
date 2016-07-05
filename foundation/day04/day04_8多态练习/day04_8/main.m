//
//  main.m
//  day04_8
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRFeeder.h"
#import "TRTiger.h"
#import "TRHippo.h"
#import "TRHuman.h"
#import "TRGrass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRAnimal *ani=[[TRTiger alloc] initWithName:@"跳跳虎"];
        TRFood *food=[[TRHuman alloc] initWithName:@"喜洋洋"];
        TRFeeder *feeder=[[TRFeeder alloc] init];
        [feeder feedForAnimal:ani WithFood:food];
        
    }
    return 0;
}
