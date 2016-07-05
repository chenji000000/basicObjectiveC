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

@property(nonatomic)NSInteger i;
@end

@implementation IBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.i = 1;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.i++;
    
    if (self.i==4) {
        self.i = 1;
    }
    
    NSString *imageName = [NSString stringWithFormat:@"fbb0%ld.jpg",self.i];
    
    self.imageView.image = [UIImage imageNamed:imageName];
}






@end
