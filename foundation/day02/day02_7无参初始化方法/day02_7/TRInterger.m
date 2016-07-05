//
//  TRInterger.m
//  day02_7
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRInterger.h"

@implementation TRInterger
-(id)init
{
   if(self=[super init])
    {
        self.integer=10;
    }
    return self;
}
-(void)show
{
    NSLog(@"%d",self.integer);
}

@end
