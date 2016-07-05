//
//  main.m
//  day04_7
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRTaxi.h"
#import "TRBus.h"
#import "TRBike.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRTransportation *p=[[TRTaxi alloc] init];
        [p print];
        p=[[TRBus alloc] init];
        [p print];
        p=[[TRBike alloc] init];
        [p print];
    }
    return 0;
}
