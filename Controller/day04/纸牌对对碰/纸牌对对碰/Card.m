//
//  Card.m
//  纸牌对对碰
//
//  Created by tarena on 15/10/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Card.h"

@implementation Card
-(instancetype)initWithSuit:(NSString *)suit andRank:(NSString *)rank
{
if(self=[super init])
{
    _suit=suit;
    _rank=rank;
    //self.suit=suit;//多运行setter方法
    _faceUp=NO;
    _matched=NO;
}
    return self;
}
+(NSArray *)allSuit
{
    return @[@"♠️",@"♥️",@"♣️",@"♦️"];

}
+(NSArray *)allRank
{
    return @[@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

//当self.suit=@"XXX"就会调用suit的setter方法
//也就是下面的这个方法
//如果希望给suit赋值时，能够对传入的值进行有效性的判断的话
//那么就可以重写系统的set方法
-(void)setSuit:(NSString *)suit
{
    //判断suit是否出现在合法的花色数组中
    if([[Card allSuit] containsObject:suit])
    {
        _suit=suit;
    }
}
-(void)setRank:(NSString *)rank
{
//判断rank是否出现在合法的大小数组中
    if([[Card allRank] containsObject:rank])
    {
        _rank=rank;
    }
}

//为cardInfo属性说明返回信息是什么
-(NSString *)cardInfo
{
    return [self.suit stringByAppendingString:self.rank];
}

@end
