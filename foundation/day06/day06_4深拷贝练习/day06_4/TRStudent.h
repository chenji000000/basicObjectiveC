//
//  TRStudent.h
//  day06_4
//
//  Created by student on 15-9-23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject<NSCopying>
@property NSString* name;
@property int ID;
@property int age;
-(id)initWithName:(NSString*)name andID:(int)ID andAge:(int)age;
-(void)show;

@end
