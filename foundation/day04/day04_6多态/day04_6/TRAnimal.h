//
//  TRAnimal.h
//  day04_6
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRAnimal : NSObject
@property NSString* name;
@property int age;
-(id)initWithName:(NSString*) name andAge:(int) age;
-(void)eat;
-(void)sleep;

@end
