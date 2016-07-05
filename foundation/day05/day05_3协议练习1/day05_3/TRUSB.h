//
//  TRUSB.h
//  day05_3
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TRUSB <NSObject>
-(void)read:(int)bytes;
@optional
-(void)write:(int)bytes;

@end
