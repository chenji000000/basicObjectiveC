//
//  TRWindow.h
//  day04_2
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRButton.h"
#import "TREdit.h"

@interface TRWindow : NSObject
{
    TRButton *button;//组合关系要求定义成成员变量，而不是属性
    TREdit *edit;
}

@end
