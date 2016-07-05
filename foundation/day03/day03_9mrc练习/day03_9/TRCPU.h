//
//  TRCPU.h
//  day03_9
//
//  Created by student on 15-9-19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRCPU : NSObject
@property NSString* name;
@property double Hz;
-(id)initWithName:(NSString*)name andHz:(double)Hz;
+(id)CPUWithName:(NSString*)name andHz:(double)Hz;

@end
