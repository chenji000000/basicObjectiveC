//
//  FirstViewController.m
//  Demo3_配置TabBar控制器
//
//  Created by tarena on 15/10/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

//在故事板中，系统自动新建某个控制器实例时，调用的是initWithCoder方法，不会去调用init或者是initWithNibName
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    if(self){
//        self.tabBarItem.selectedImage=[UIImage imageNamed:@"full_bell"];
        //使用KVC的写法为selectedImage属性赋值
        [self.navigationController.tabBarItem setValue:[UIImage imageNamed:@"full_bell"] forKey:@"selectedImage"];
    
    }
    return self;

}

//-(instancetype)init
//{
//    if (self=[super init]) {
//        
//    }
//    return self;
//}
//


- (void)viewDidLoad {
    [super viewDidLoad];
    
}


@end
