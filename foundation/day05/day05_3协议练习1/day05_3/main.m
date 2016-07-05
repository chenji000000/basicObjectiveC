//
//  main.m
//  day05_3
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRUdisk.h"
#import "TRMovedisk.h"
#import "TRCamera.h"
#import "TRComputer.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRComputer *com=[[TRComputer alloc] init];
        TRUdisk *ud=[[TRUdisk alloc] init];
        com.usb1=ud;
        TRMovedisk *md=[[TRMovedisk alloc] init];
        com.usb2=md;
        [com dataCopyFromUsb1ToUsb2:1024];
        TRCamera *camera=[[TRCamera alloc] init];
        com.usb1=camera;
        [com dataCopyFromUsb1ToUsb2:1024];//摄像头的数据传到移动硬盘
    }
    return 0;
}
