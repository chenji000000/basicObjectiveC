//
//  TRCircle.h
//  day04_9图形程序
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRShape.h"

@interface TRCircle : TRShape
@property(nonatomic,assign)double r;
-(id)initWithR:(int)r;
+(id)circleWithR:(int)r;

@end
