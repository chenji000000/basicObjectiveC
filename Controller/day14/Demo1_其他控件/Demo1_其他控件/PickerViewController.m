//
//  PickerViewController.m
//  Demo1_其他控件
//
//  Created by tarena on 15/10/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
//准备第一列及第二列的数据
@property(nonatomic,strong)NSDictionary *allData;

@property(nonatomic,strong)NSArray *allCities;
@property(nonatomic,strong)NSArray *allSubAreas;

@end

@implementation PickerViewController


-(NSDictionary *)allData
{
    if (!_allData) {
        _allData=@{@"北京":@[@"东城",@"西城",@"朝阳",@"海淀"],@"上海":@[@"静安",@"徐汇",@"黄埔"],@"广州":@[@"天河",@"白云",@"越秀"]
                   };
    }
    return _allData;
}

-(NSArray *)allCities
{
    if (!_allCities) {
        //将字典中的所有key取出，作为第一列的数据源
        _allCities=self.allData.allKeys;
    }
    return _allCities;

}
-(NSArray *)allSubAreas
{
    if (!_allSubAreas) {
       //按照allCities[0]这个默认被选中的城市，作为key找到这个key对应的子地区取出，作为界面刚刚显示时，默认出现的第二列的数据源
        _allSubAreas=[self.allData objectForKey:self.allCities[0]];
    }
    return _allSubAreas;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;

}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{

    if (component==0) {
        return self.allCities.count;
    }else{
    
        return self.allSubAreas.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

    if (component==0) {
        return self.allCities[row];
    }else{
        return self.allSubAreas[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //只有当选中的数据在第一列时，读取选中的城市名，做key，找到该城市对应的子地区
    if (component==0) {
        //根据选中的行号，获取该行对应的城市名
        NSString *selectedCityName=self.allCities[row];
        //根据选中的城市名做key，找到子地区
        self.allSubAreas=[self.allData objectForKey:selectedCityName];
        //更新界面
        [pickerView reloadComponent:1];
        //设置第二列的第一行处于被选中
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }

}
@end
