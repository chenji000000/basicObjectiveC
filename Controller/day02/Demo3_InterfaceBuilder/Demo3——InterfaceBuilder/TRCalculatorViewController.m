//
//  TRCalculatorViewController.m
//  Demo3——InterfaceBuilder
//
//  Created by tarena on 15/10/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRCalculatorViewController.h"

@interface TRCalculatorViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@end

@implementation TRCalculatorViewController
//哪个按钮触发了事件，那个按钮就被当做参数传入这个方法
- (IBAction)buttonTap:(UIButton *)button
{
   //可以知道用户按下的是那个按钮吗？
    //获取按钮上面的title
    NSString *title=[button titleForState:UIControlStateNormal];
    char ch=[title characterAtIndex:0];
    //
    if((ch>='0'&&ch<='9')||ch=='.'){
        NSLog(@"是数字%c",ch);
//        if([self.displayLabel.text isEqualToString:@"0.0"]){
//        self.displayLabel.text=@"";
//        }
        //如果是数字或.就追加显示
        self.displayLabel.text=[self.displayLabel.text stringByAppendingString:title];
    }
    else{
    //如果是+ — * / =就进行计算
        switch(ch){
    case '+':
        
        break;
    case '-':
                
        break;
    case '*':
                
        break;
    case '/':
                
        break;
    case '=':
                
        break;
                
        }
    }
    
    
//    NSLog(@"按钮%@被按下",title);
//    self.displayLabel.text=title;
    
}

@end
