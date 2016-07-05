//
//  ViewController.m
//  Demo02-CLGeocoder
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
@property(nonatomic,strong) CLGeocoder *geocoder;
@end

@implementation ViewController

-(CLGeocoder *)geocoder
{
    if (!_geocoder) {
        _geocoder=[[CLGeocoder alloc]init];
    }
    return _geocoder;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)clickGeoCoder:(id)sender {
    //给定名字——>经纬度
    NSString *name=@"武汉";
    [self.geocoder geocodeAddressString:name completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        //获取地标数组中第一个对象
        if (!error) {
            CLPlacemark *placemark=[placemarks firstObject];
            NSLog(@"地理坐标:%f;%f",placemark.location.coordinate.latitude,placemark.location.coordinate.longitude);
            //详细信息
            NSLog(@"详细信息:%@",placemark.addressDictionary);
        }
    }];
}

- (IBAction)clickGeoDecoder:(id)sender {
    //经纬度——>详细信息
    CLLocation *location=[[CLLocation  alloc] initWithLatitude:30.584355 longitude:114.298572];
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (!error) {
            for (CLPlacemark *placemark in placemarks) {
                //详细信息
                NSLog(@"详细信息:%@",placemark.addressDictionary);
            }
        }
    }];
}









@end
