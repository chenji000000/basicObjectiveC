//
//  main.m
//  day07_10
//
//  Created by student on 15-9-24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char name[100];
        NSLog(@"Please input your name");
        scanf("%s",name);
        NSString *fileName=[NSString stringWithCString:name encoding:NSASCIIStringEncoding];
        char passcode[100];
        NSLog(@"Please input your passcode");
        scanf("%s",passcode);
        NSString *filePasscode=[NSString stringWithCString:passcode encoding:NSASCIIStringEncoding];
        
        NSError *error=[[NSError alloc] init];
        NSString *fileName1=[NSString stringWithContentsOfFile:@"/Users/student/Desktop/wenjianming" encoding:NSUTF8StringEncoding error:&error];
        if([fileName1 isEqualToString:fileName]==YES)
        {
        NSString *filePasscode1=[NSString stringWithContentsOfFile:@"/Users/student/Desktop/mima" encoding:NSUTF8StringEncoding error:&error];
            if([filePasscode1 isEqualToString:filePasscode]==YES)
            
                NSLog(@"sign up");
            
            else
            
                NSLog(@"The name or the passcode is wrong");
            }
        else
            NSLog(@"The name or the passcode is wrong");
        }
    
    return 0;
}
