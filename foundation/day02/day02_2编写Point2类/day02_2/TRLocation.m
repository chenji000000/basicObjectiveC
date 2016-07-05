//
//  TRLocation.m
//  day02_2
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRLocation.h"

@implementation TRLocation
-(void)setX:(double)x
{
    _x=x;
}
-(double)getX
{
    return _x;
}
-(void)setY:(double)y
{
    _y=y;
}
-(double)getY
{
    return _y;
}
-(void)show
{
    NSLog(@"坐标(%lf,%lf)",_x,_y);
}
-(void)up
{
    _y++;
}
-(void)down
{
    _y--;
}
-(void)left
{
    _x--;
}
-(void)right
{
    _x++;
}
-(void)moveUp
{
    [self up];
    [self show];
}
-(void)moveDown
{
    [self down];
    [self show];
}
-(void)moveLeft
{
    [self left];
    [self show];
}
-(void)moveRight
{
    [self right];
    [self show];
}

@end
