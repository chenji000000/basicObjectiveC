//
//  ViewController.m
//  Demo01-WebView
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "Weather.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *weatherTextView;
@property (weak, nonatomic) IBOutlet UITextView *jsonTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//NSData->JSON object(NSArray/NSDictionary)->OC Object
- (IBAction)convertJSON2Object:(id)sender {
    //url/request
    NSURL *url=[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=2de143494c0b295cca9337e1e96b00e0"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    //session
    //task
    NSURLSessionDataTask *task=[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //子线程解析
        if (!error) {
            NSDictionary *weatherDic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        [self parseWeatherDic:weatherDic];
        }
        
    }];
    //执行task
    [task resume];
}
-(void)parseWeatherDic:(NSDictionary *)weatherDic
{
    //V2:使用Model类进行解析
    Weather *weatherObject=[Weather weatherParseWithJSON:weatherDic];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //更新界面
        self.weatherTextView.text=[NSString stringWithFormat:@"维度:%@;经度:%@\n 天气描述:%@ \n 日出时间:%@",weatherObject.lat,weatherObject.lon,weatherObject.desc,weatherObject.sunrise];
    });
}
//NSArray->JSON Object->NSData
- (IBAction)convertObject2JSON:(id)sender {
    NSDictionary *firstDic=@{@"name":@"Maggie",@"age":@19,@"sex":@YES,@"skills":@[@"Objective-C",@"Java"]};
    NSDictionary *secondDic=@{@"name":@"Jonny",@"age":@20,@"sex":@NO,@"skills":@[@"Ruby",@"Python"]};
    NSArray *array=@[firstDic,secondDic];
    //判定是否array可以转换
    BOOL isConvert=[NSJSONSerialization isValidJSONObject:array];
    
    if (isConvert) {
        NSData *data=[NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:nil];
        self.jsonTextView.text=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
}


@end
