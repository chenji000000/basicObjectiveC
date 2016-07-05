//
//  TRMyClass.m
//  day05_1
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMyClass.h"

@implementation TRMyClass
@synthesize content=_content;
-(void)show
{
    NSLog(@"秀一下,%@",self.content);
}
@end
