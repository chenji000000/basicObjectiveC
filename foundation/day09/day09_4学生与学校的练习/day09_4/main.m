//
//  main.m
//  day09_4
//
//  Created by student on 15-9-29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu1=[[TRStudent
                          alloc] initWithName:@"zhangsan" andID:1000];
        TRStudent *stu2=[[TRStudent
                          alloc] initWithName:@"lisi" andID:1001];
        TRStudent *stu3=[[TRStudent
                          alloc] initWithName:@"wangwu" andID:1002];
        TRStudent *stu4=[[TRStudent
                          alloc] initWithName:@"zhaoliu" andID:1003];
        TRStudent *stu5=[[TRStudent
                          alloc] initWithName:@"qianqi" andID:1004];
        TRStudent *stu6=[[TRStudent
                          alloc] initWithName:@"guanyu" andID:1005];
        TRStudent *stu7=[[TRStudent
                          alloc] initWithName:@"zhangfei" andID:1006];
        TRStudent *stu8=[[TRStudent
                          alloc] initWithName:@"zhaoyun" andID:1007];
        
        NSSet *class1=[NSSet setWithObjects:stu1,stu2,nil];
        NSSet *class2=[NSSet setWithObjects:stu3,stu4,nil];
        NSSet *class3=[NSSet setWithObjects:stu5,stu6,nil];
        NSSet *class4=[NSSet setWithObjects:stu7,stu8,nil];
        
        NSSet *college1=[NSSet setWithObjects:class1,class2,nil];
        NSSet *college2=[NSSet setWithObjects:class3,class4,nil];
        
        NSSet *school=[NSSet setWithObjects:college1,college2,nil];
        
        NSEnumerator *e1=[school objectEnumerator];
        NSSet *college;
        while(college=[e1 nextObject])
        {
            NSEnumerator *e2=[college objectEnumerator];
            NSSet *class;
            while(class=[e2 nextObject])
            {
                NSEnumerator *e3=[class objectEnumerator];
                TRStudent *stu;
                while(stu=[e3 nextObject])
                {
                //1.遍历所有学生信息
                //NSLog(@"%@",stu);
                //2.只显示zhangsan的信息
                //if([stu.name isEqualToString:@"zhangsan"]==YES)
                //NSLog(@"%@",stu);
                //3.只显示ID为1000的学生信息
                    if(stu.ID==1000)
                    {
                    NSLog(@"%@",stu);
                    }
                }
            }
        }
    }
    return 0;
}
