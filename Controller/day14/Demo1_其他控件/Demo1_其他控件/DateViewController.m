//
//  DateViewController.m
//  Demo1_其他控件
//
//  Created by tarena on 15/10/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "DateViewController.h"

@interface DateViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation DateViewController

- (IBAction)clickButton:(id)sender {
    //获取选择器中的日期
    NSDate *date=self.datePicker.date;
    //创建格式化器
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    //设置格式化标准
    formatter.dateFormat=@"yyyy-MM-dd HH:mm:ss";
    //将date进行格式化
    NSString *dateString=[formatter stringFromDate:date];
    
    self.timeLabel.text=dateString;
    
//    self.timeLabel.text=[NSString stringWithFormat:@"%@",self.datePicker.date];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
