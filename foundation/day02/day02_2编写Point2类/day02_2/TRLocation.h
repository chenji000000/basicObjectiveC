//
//  TRLocation.h
//  day02_2
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRLocation : NSObject
{
    double _x;//成员变量
    double _y;
}
-(void)setX:(double)x;
-(double)getX;
-(void)setY:(double)y;
-(double)getY;
-(void)show;
-(void)moveUp;
-(void)moveDown;
-(void)moveLeft;
-(void)moveRight;
@end
