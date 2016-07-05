//
//  TRRectangle.h
//  day04_9图形程序
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRShape.h"

@interface TRRectangle : TRShape
@property(nonatomic,assign)float x;
@property(nonatomic,assign)float y;
-(id)initWithX:(int)x andY:(int)y;
+(id)rectangleWithX:(int)x andY:(int)y;

@end
