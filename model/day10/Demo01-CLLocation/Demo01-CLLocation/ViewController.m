//
//  ViewController.m
//  Demo01-CLLocation
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>
@property(nonatomic,strong) CLLocationManager *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化manager对象
    self.manager=[[CLLocationManager alloc] init];
    //设置代理
    self.manager.delegate=self;
    //征求用户的同意（假定同意）
    //iOS8+才开始征求用户的同意
    if ([[UIDevice currentDevice].systemVersion doubleValue]>8.0) {
        //征求是否愿意前台和后台都定位
//        [self.manager requestAlwaysAuthorization];
        //征求用户是否只在前台定位(Info.plist添加key)
        [self.manager requestWhenInUseAuthorization];
    }else{
    //直接定位（不需要征求用户同意）
        [self.manager startUpdatingLocation];
    }
    
    
    
}

#pragma mark---CLLocationManagerDelegate
//查看用户是否同意
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
            //用户允许在使用期间定位（前台）
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            //设定定位精确度
            self.manager.desiredAccuracy=kCLLocationAccuracyBest;
            //开始定位操作
            [self.manager startUpdatingLocation];
            break;
            //用户不允许定位（第二种方案）
            case kCLAuthorizationStatusDenied:
            NSLog(@"用户不允许定位");
            break;
            
        default:
            break;
    }
}
//已经定位到用户的位置
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
//locations（数组，最后一项是用户最新的位置；至少一项）
    CLLocation *location=[locations lastObject];
    NSLog(@"latitude:%f; longitude:%f",location.coordinate.latitude,location.coordinate.longitude);
    //停止定位
    [self.manager stopUpdatingLocation];
}
@end
