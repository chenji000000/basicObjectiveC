//
//  ViewController.m
//  Demo01-WebView
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

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
//解析JSON数据（类型）
    //经纬度
    NSNumber *longitude=weatherDic[@"coord"][@"lon"];
    NSNumber *latitude=weatherDic[@"coord"][@"lat"];
    NSString *desc=weatherDic[@"weather"][0][@"description"];
    //weather/main天气主要描述
    //main/temp温度
    NSNumber *temp=weatherDic[@"main"][@"temp"];
    //main/pressure气压
    NSNumber *pressure=weatherDic[@"main"][@"pressure"];
    //main/humidity湿度
    NSNumber *humidity=weatherDic[@"main"][@"humidity"];
    //main/temp_min最低温度
    NSNumber *temp_min=weatherDic[@"main"][@"temp_min"];
    //main/temp_max最高温度
    NSNumber *temp_max=weatherDic[@"main"][@"temp_max"];
    //日出时间（UNIX时间戳）
    NSNumber *sunrise=weatherDic[@"sys"][@"sunrise"];
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:[sunrise doubleValue]];
    //sys/sunset日落
    NSNumber *sunset=weatherDic[@"sys"][@"sunset"];
    NSDate *dateSet=[NSDate dateWithTimeIntervalSince1970:[sunset doubleValue]];
    
    
    //创建NSDataFormatter格式对象
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:MM:SS"];
    NSString *sunriseStr=[formatter stringFromDate:date];
    NSString *sunsetStr=[formatter stringFromDate:dateSet];
//    NSLog(@"%@",sunriseStr);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //更新界面
        self.weatherTextView.text=[NSString stringWithFormat:@"维度:%@;经度:%@\n temp:%@;pressure:%@;humidity:%@;temp_min:%@;temp_max:%@\n 天气描述:%@ \n 日出时间:%@;日落时间:%@",latitude,longitude,temp,pressure,humidity,temp_min,temp_max,desc,sunriseStr,sunsetStr];
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
