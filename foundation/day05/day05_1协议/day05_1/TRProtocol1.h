//
//  TRProtocol1.h
//  day05_1
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TRProtocol1 <NSObject>
-(void)method1;
@required//这个关键字后面的方法在采纳该协议的类中必须实现（默认方式）
-(void)fun;
@optional//这个关键字后面的方法在采纳该协议的类中可实现也可不实现
-(void)fun1;//可实现可不实现
@end
