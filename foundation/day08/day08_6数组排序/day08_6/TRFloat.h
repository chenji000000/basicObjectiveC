//
//  TRFloat.h
//  day08_6
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRFloat : NSObject
@property float f;
-(id)initWithFloat:(float)f;
-(NSComparisonResult)compareFloat:(TRFloat*)other;
@end
