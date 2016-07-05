//
//  TRBook.h
//  day06_5
//
//  Created by student on 15-9-23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRBook : NSObject<NSCopying>
@property int price;
-(id)initWithPrice:(int)price;
-(void)show;

@end
