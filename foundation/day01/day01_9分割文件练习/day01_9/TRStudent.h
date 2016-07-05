//
//  TRStudent.h
//  day01_9
//
//  Created by student on 15-9-17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject
{
    NSString* _name;
    int _ID;
    NSString* _address;
    double _CScore;
}
-(void)setName:(NSString*)name;
-(NSString*)getName;
-(void)setID:(int)ID;
-(int)getID;
-(void)setAddress:(NSString*)address;
-(NSString*)getAddress;
-(void)setCScore:(double)CScore;
-(double)getCScore;
-(void)show;

@end
