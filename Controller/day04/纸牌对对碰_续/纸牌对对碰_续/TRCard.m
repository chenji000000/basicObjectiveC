//
//  TRCard.m
//  纸牌对对碰_续
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRCard.h"

@implementation TRCard
+(NSArray *)validSuits
{
    return @[@"♠️",@"❤️",@"♣️",@"♦️"];
}
-(void)setSuit:(NSString *)suit
{
    if ([[TRCard validSuits] containsObject:suit]) {
        _suit=suit;
    }
}
-(NSString *)suit
{
    return _suit?_suit:@"?";
}
@synthesize suit=_suit;
-(void)setRank:(NSUInteger)rank
{
    if(rank<=13){
        _rank=rank;
    }
}
+(NSArray *)randStrins
{
    return @[@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}
-(NSString *)content
{
    NSString *rankString=[TRCard randStrins][self.rank];
    return [self.suit stringByAppendingString:rankString];
}
+(NSUInteger)maxRank
{
    return [[TRCard randStrins] count]-1;
}
@end
