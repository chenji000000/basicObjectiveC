//
//  AViewController.m
//  星座运程
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"

@interface AViewController ()<BViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)bViewController:(BViewController *)bvc didFinishInput:(NSInteger)index
{

    NSString *text=@"";
    switch (index) {
        case 0:
            text=@"白羊座";
            break;
        case 1:
            text=@"金牛座";
            break;
        case 2:
            text=@"双子座";
            break;
        case 3:
            text=@"巨蟹座";
            break;
        case 4:
            text=@"狮子座";
            break;
        case 5:
            text=@"处女座";
            break;
        case 6:
            text=@"天秤座";
            break;
        case 7:
            text=@"天蝎座";
            break;
        case 8:
            text=@"射手座";
            break;
        case 9:
            text=@"摩羯座";
            break;
        case 10:
            text=@"水瓶座";
            break;
        case 11:
            text=@"双鱼座";
            break;
        default:
            break;
    }
    self.label.text=text;
}
- (IBAction)gotoBVC:(id)sender {
    BViewController *bvc=[[BViewController alloc] initWithNibName:@"BViewController" bundle:nil];
    
    bvc.delegate=self;
    
    [self presentViewController:bvc animated:YES completion:nil];
}


@end
