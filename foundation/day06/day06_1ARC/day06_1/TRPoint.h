//
//  TRPoint.h
//  day06_1
//
//  Created by student on 15-9-23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRPoint : NSObject
@property int x;
@property int y;
-(id)initWithX:(int)x andY:(int)y;
+(id)pointWithX:(int)x andY:(int)y;
-(void)show;

@end
