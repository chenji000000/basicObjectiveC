//
//  AddContactViewController.m
//  Demo01-CoreData-Contact
//
//  Created by tarena on 15/11/30.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "AddContactViewController.h"
#import "Contact.h"

@interface AddContactViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *signatureTextField;

@end

@implementation AddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //将传过来的好友对象赋给界面的两个textField
    if (self.contact !=nil) {
        self.nameTextField.text = self.contact.name;
        self.signatureTextField.text = self.contact.signature;
    }
    
}

- (IBAction)cancelBarButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//点击右上角保存
- (IBAction)saveBarButton:(id)sender {
    //获取上下文对象（从结果控制器对象中获取）
    NSManagedObjectContext *context = [self.resultsController managedObjectContext];
    //如果点击"保存"是执行插入操作
    if (self.contact == nil) {
        //获取entity的名字
        NSString *entityName = [[[self.resultsController fetchRequest] entity] name];
        //指定entity并返回一个空的模型对象
        self.contact = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:context];
    }
    
    
    //设置要保存的对象数据
    self.contact.name = self.nameTextField.text;
    self.contact.signature = self.signatureTextField.text;
    
    //插入一条数据到SQLite中
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"插入数据失败：%@",error.userInfo);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
