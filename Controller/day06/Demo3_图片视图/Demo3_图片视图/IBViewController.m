//
//  IBViewController.m
//  Demo3_图片视图
//
//  Created by tarena on 15/10/15.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "IBViewController.h"

@interface IBViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation IBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //点击视图后，修改图片框中的图片
    self.imageView.image=[UIImage imageNamed:@"button_rewind.png"];
}
@end
