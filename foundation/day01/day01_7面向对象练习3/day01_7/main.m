//
//  main.m
//  day01_7
//
//  Created by student on 15-9-17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRTeacher : NSObject
{
    NSString* _name;
    NSString* _class;
    int _student;
}
-(void)setName:(NSString*)name;
-(NSString*)getName;
-(void)setClass:(NSString*)class;
-(NSString*)getClass;
-(void)setStudent:(int)student;
-(int)getStudent;
-(void)show;
@end

@implementation TRTeacher

-(void)setName:(NSString*)name
{
    _name=name;
}
-(NSString*)getName
{
    return _name;
}
-(void)setClass:(NSString*)class
{
    _class=class;
}
-(NSString*)getClass
{
    return _class;
}
-(void)setStudent:(int)student
{
    _student=student;
}
-(int)getStudent
{
    return _student;
}
-(void)show
{
    NSLog(@"教师%@教%@，班里有%d个学生",_name,_class,_student);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRTeacher* t=[TRTeacher alloc];
        [t setName:@"张三"];
        [t setClass:@"法语"];
        [t setStudent:20];
        [t show];
    }
    return 0;
}
