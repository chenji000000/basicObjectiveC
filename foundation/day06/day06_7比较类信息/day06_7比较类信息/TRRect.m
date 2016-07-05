//
//  TRRect.m
//  day06_7比较类信息
//
//  Created by student on 15-9-23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRRect.h"

@implementation TRRect
-(id)initWithOrigin:(TRPoint *)origin andWidth:(int)width andHeight:(int)height
{
if(self=[super init])
{
    self.origin=origin;
    self.width=width;
    self.height=height;
}
    return self;
}
-(int)area
{
    return self.width*self.height;
}
-(int)perimeter
{
    return 2*(self.width+self.height);
}

@end
