//
//  TRExample.h
//  day02_3
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRExample : NSObject
{
    int _i0;//访问权限为保护的，只能在类内使用
    @public
    int _i1;//访问权限为公有的，类内类外都能使用
    @package
    int _i2;//访问权限为包内的，类内类外都能使用
    @protected
    int _i3;//保护的:默认方式
    @private
    int _i4;//私有的：类内使用
}
@end
