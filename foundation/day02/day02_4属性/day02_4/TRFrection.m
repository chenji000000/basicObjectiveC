//
//  TRFrection.m
//  day02_4
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRFrection.h"

@implementation TRFrection
@synthesize n=_n;
//-(void)setN:(int)n
//{
//    _n=n;
//}
//-(int)getN
//{
//    return _n;
//}
@synthesize d=_d;
//-(void)setD:(int)d
//{
//    _d=d;
//}
//-(int)getD
//{
//    return _d;
//}
-(void)show
{
    NSLog(@"%d/%d",_n,_d);
}

@end
