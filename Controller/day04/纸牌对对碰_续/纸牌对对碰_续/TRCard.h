//
//  TRCard.h
//  纸牌对对碰_续
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRCard : NSObject
@property(nonatomic,strong,readonly) NSString *content;
@property(nonatomic,strong)NSString *suit;
@property(nonatomic) NSUInteger rank;

@property(nonatomic,getter=isChosen) BOOL chosen;
@property(nonatomic,getter=isMatched) BOOL matched;

@end
