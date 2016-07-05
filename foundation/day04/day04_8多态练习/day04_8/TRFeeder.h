//
//  TRFeeder.h
//  day04_8
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRAnimal.h"
#import "TRFood.h"

@interface TRFeeder : NSObject

-(void)feedForAnimal:(TRAnimal*)animal WithFood:(TRFood*)food;

@end
