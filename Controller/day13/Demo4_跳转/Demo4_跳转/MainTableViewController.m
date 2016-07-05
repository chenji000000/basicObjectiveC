//
//  MainTableViewController.m
//  Demo4_跳转
//
//  Created by tarena on 15/10/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MainTableViewController.h"
#import "WhiteViewController.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row==1) {
        //点击了第二行，跳转到独立的，storyboard的id为blueVC的那个独立的场景
        
        //1.实例化这个场景的VC
        //在为这个独立的场景设置好storyboard 的id后创建实例的工作由故事板来完成
        UIViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"blueVC"];
        
        //2.push出这个VC
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row==2){
    //推出独立的xib
        //1.创建控制器实例
        
        WhiteViewController *whiteVC=[[WhiteViewController alloc] initWithNibName:@"WhiteViewController" bundle:nil];
        
        //2.推出控制器
        [self.navigationController pushViewController:whiteVC animated:YES];
    
    
    }
}


@end
