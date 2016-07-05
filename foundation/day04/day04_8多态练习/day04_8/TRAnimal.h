//
//  TRAnimal.h
//  day04_8
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRFood.h"

@interface TRAnimal : NSObject
@property NSString* name;
-(id)initWithName:(NSString*)name;
-(void)eat:(TRFood*)food;

@end
