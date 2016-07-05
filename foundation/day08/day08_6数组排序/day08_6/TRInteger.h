//
//  TRInteger.h
//  day08_6
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRInteger : NSObject
@property int integer;
-(id)initWithInteger:(int)integer;
-(NSComparisonResult)compareInt:(TRInteger*)other;
@end
