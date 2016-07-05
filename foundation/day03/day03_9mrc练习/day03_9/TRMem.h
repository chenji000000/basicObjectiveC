//
//  TRMem.h
//  day03_9
//
//  Created by student on 15-9-19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRMem : NSObject
@property NSString* name;
@property int size;
-(id)initWithName:(NSString*)name andSize:(int)size;
+(id)MemWithName:(NSString*)name andSize:(int)size;

@end
