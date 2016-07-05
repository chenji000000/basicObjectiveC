//
//  main.m
//  day01_5
//
//  Created by student on 15-9-17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject
{
    int _ID;
}
-(void)setID:(int)ID;
-(int)getID;
-(void)show;
@end

@implementation TRStudent

-(void)setID:(int)ID
{
    _ID=ID;
}

-(int)getID
{
    return _ID;
}

-(void)show
{
    NSLog(@"我的学号是%d",_ID);
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu=[TRStudent alloc];
        [stu setID:1000];
        [stu show];
        
        TRStudent *stu1=[TRStudent alloc];
        [stu1 setID:1001];
        NSLog(@"%d",[stu1 getID]);
    }
    return 0;
}
