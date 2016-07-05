//
//  ViewController.m
//  Day05_ImagePicker
//
//  Created by tarena on 15/12/18.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

#pragma mark---相册的代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    //original:原始的
    _imageView.image = info[UIImagePickerControllerOriginalImage];
    
    //获取编辑后的图片
    if (picker.allowsEditing) {
        _imageView.image = info[UIImagePickerControllerEditedImage];
    }
    
    
    //如果实现了此协议，那么弹出的图片选择控制器不会自动消失
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//
//}

//相册
- (IBAction)getPhotoFromLb:(id)sender {
    UIImagePickerController *vc = [UIImagePickerController new];
    //想要知道选择的图片
    vc.delegate = self;
    //开启编辑状态
    vc.allowsEditing = YES;
    [self presentViewController:vc animated:YES completion:nil];
    
}

//拍照--必须真机
- (IBAction)getPhotoFromCamera:(id)sender {
    UIImagePickerController *vc = [UIImagePickerController new];
    vc.delegate = self;
    //选择照片源数据---默认是相册
    vc.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    
    [self presentViewController:vc animated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
