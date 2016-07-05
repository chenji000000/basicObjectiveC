//
//  main.m
//  day04_5
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRAnimal.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRHead *head=[[TRHead alloc] init];
        TRLimb *limb=[[TRLimb alloc] init];
        TRTruck *truck=[[TRTruck alloc] init];
        {
            TRAnimal *ani=[[TRAnimal alloc] init];
            ani.head=head;
            ani.limb=limb;
            ani.truck=truck;
        }
        NSLog(@"-----------");
    }
    return 0;
}
