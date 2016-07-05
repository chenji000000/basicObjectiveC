//
//  TRAnnotation.h
//  Demo03-MKMapView
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface TRAnnotation : NSObject<MKAnnotation>
//位置
@property(nonatomic,assign)CLLocationCoordinate2D coordinate;
//title（可选）
@property(nonatomic,copy) NSString *title;

//subtitle（可选）
@property (nonatomic,copy) NSString *subtitle;
@end
