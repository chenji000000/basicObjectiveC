//
//  main.m
//  day01_10
//
//  Created by student on 15-9-17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TREmploee : NSObject
{
    NSString* _name;
    int _age;
    BOOL _gender;
    double _salary;
}
-(void)setName:(NSString*)name;
-(NSString*)name;
-(void)setAge:(int)age;
-(int)age;
-(void)setGender:(BOOL)gender;
-(BOOL)gender;
-(void)setSalary:(double)salary;
-(double)salary;
-(void)show;
@end

@implementation TREmploee

-(void)setName:(NSString*)name
{
    _name=name;
}
-(NSString*)name
{
    return _name;
}
-(void)setAge:(int)age
{
    _age=age;
}
-(int)age
{
    return _age;
}
-

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
