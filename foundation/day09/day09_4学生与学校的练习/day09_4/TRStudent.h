//
//  TRStudent.h
//  day09_4
//
//  Created by student on 15-9-29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject
@property NSString* name;
@property int ID;
-(id)initWithName:(NSString*)name andID:(int)ID;
-(void)print:(id)condition;


@end
