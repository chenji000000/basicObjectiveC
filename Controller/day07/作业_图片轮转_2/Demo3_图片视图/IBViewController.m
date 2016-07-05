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
@property(nonatomic,strong)NSArray *imageNames;
@property(nonatomic)NSInteger i;
@end

@implementation IBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(NSArray *)imageNames{
    if (!_imageNames) {
        _imageNames = @[@"fbb01.jpg",@"fbb02.jpg",@"fbb03.jpg"];
    }
    return _imageNames;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIImage *image = [UIImage imageNamed:self.imageNames[self.i++%3]];
    // 点击视图后,修改图片框中的图片
    self.imageView.image = image;
}






@end
