//
//  main.m
//  day07_7
//
//  Created by student on 15-9-24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char ID[20];
        NSLog(@"输入身份证号");
        scanf("%s",ID);
        NSString *strID=[NSString stringWithFormat:@"%s",ID];
        NSLog(@"%@",strID);
        NSRange r={6,8};
        NSString *birthday=[strID substringWithRange:r];
        NSLog(@"出生年月:%@",birthday);
        
        NSString *idData[][2]={
            {@"北京",@"11"},
            {@"天津",@"12"},
            {@"上海",@"31"},
            {@"江苏",@"32"}
        };
        NSString *city=[strID substringToIndex:2];
        for(int i=0;i<4;i++)
        {
            NSString *idCity=idData[i][1];
            if([city isEqualToString:idCity]==YES)
            {
                NSLog(@"所属省份:%@",idData[i][0]);
                break;
            }
        }
    }
    return 0;
}
