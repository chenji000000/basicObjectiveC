//
//  InputViewController.m
//  Demo5_正向传值
//
//  Created by tarena on 15/10/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "InputViewController.h"
#import "DisplayViewController.h"

@interface InputViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation InputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//此方法在触发Segue跳转动作之前，自动执行，如果你希望在跳转之前，截获跳转动作，来做点什么，重写该方法
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *str=nil;
    if ([segue.identifier isEqualToString:@"Segue1"]) {
        str=@"点击了空白处:";
    }else{
    str=@"点击了按钮:";
    }
    
    //1.根据Segue对象获取要跳转到的目标VC的引用
    DisplayViewController *vc=segue.destinationViewController;
    
    //2.使用获取到的目标VC，为其公开的属性赋值，完成传值动作
    vc.msg=[str stringByAppendingString: self.textField.text];
    
    

}

//点击空白处时触发Segue1
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    [self performSegueWithIdentifier:@"Segue1" sender:nil];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
