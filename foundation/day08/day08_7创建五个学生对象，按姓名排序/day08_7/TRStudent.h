//
//  TRStudent.h
//  day08_7
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject<NSCopying>
@property NSString* name;
@property int age;
-(id)initWithName:(NSString*)name andAge:(int)age;
-(NSComparisonResult)compareName:(TRStudent*)other;

@end
