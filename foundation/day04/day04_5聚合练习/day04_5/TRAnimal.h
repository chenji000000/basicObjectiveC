//
//  TRAnimal.h
//  day04_4组合练习
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRHead.h"
#import "TRLimb.h"
#import "TRTruck.h"

@interface TRAnimal : NSObject
@property TRHead* head;
@property TRLimb* limb;
@property TRTruck* truck;
@end
