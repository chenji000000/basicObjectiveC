//
//  TRDeck.m
//  纸牌对对碰_续
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDeck.h"
#import "TRCard.m"

@implementation TRDeck
-(NSMutableArray *)cards
{
    if (!_cards)
        _cards=[[NSMutableArray alloc] init];
        return _cards;
    
}
-(instancetype)init
{
if(self=[super init])
{
    for (NSString *suit in [TRCard validSuits]) {
        for (NSUInteger rank=1; rank<=[TRCard maxRank]; rank++) {
            TRCard *card=[[TRCard alloc] init];
            card.suit=suit;
            card.rank=rank;
            [self.cards addObject:card];
        }
        }
 }
    return self;
   
}
-(TRCard *)randomCard
{
    unsigned int index=arc4random()%self.cards.count;
    TRCard *card=self.cards[index];
    [self.cards removeObjectAtIndex:index];
    return card;
}
@end
