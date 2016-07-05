//
//  TRCircle.h
//  day06_1
//
//  Created by student on 15-9-23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPoint.h"

@interface TRCircle : NSObject
@property double r;
@property(weak) TRPoint* center;//strong的作用和retain一样,


@end
