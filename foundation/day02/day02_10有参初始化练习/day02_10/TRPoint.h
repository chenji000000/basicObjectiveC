//
//  TRPoint.h
//  day02_10
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRPoint : NSObject
@property int x;
@property int y;
-(id)initWithX:(int)x andY:(int)y;
-(void)show;

@end
