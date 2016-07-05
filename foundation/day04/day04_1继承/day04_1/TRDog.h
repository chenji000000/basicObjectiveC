//
//  TRDog.h
//  day04_1
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TRAnimal.h"

@interface TRDog : TRAnimal
-(void)watchHome;

@property int weight;
-(id)initWithName:(NSString *)name andAge:(int)age andWeight:(int)weight;

-(void)bark;

@end
