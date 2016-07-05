//
//  main.m
//  day05_10员工管理程序
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStaff.h"
#import "TRHR.h"
#import "TREmployee.h"

typedef enum
{
CODER=1,TESTER,PROGRAMMER
}job;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TREmployee* emp=[TRHR hrByNum:CODER];
        TREmployee* emp2=[TRHR hrByNum:TESTER];
        TREmployee* emp3=[TRHR hrByNum:PROGRAMMER];
        
        TREmployee* emps[3]={emp,emp2,emp3};
        
        for(int i=0;i<3;i++)
        {
            [emps[i] print];
        }
    }
    return 0;
}
