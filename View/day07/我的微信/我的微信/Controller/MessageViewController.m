//
//  MessageViewController.m
//  我的微信
//
//  Created by tarena on 15/11/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MessageViewController.h"
#import "Message.h"
#import "MessageCell.h"

@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputViewBottomConstraint;
//属性：记录全部的聊天内容
@property(nonatomic,strong)NSMutableArray *allMessages;
//连线界面上拖拽的tableView
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation MessageViewController

-(NSMutableArray *)allMessages
{
    if (!_allMessages) {
        _allMessages=[[Message demoData] mutableCopy];
    }
    return _allMessages;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.allMessages.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取本行对应的消息对象
    Message *msg=self.allMessages[indexPath.row];
    
    
    MessageCell *cell=[tableView dequeueReusableCellWithIdentifier:msg.fromMe?@"Cell1":@"Cell2" forIndexPath:indexPath];
    
    
    cell.messageLabel.text=msg.content;
    
    return cell;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    //为了让tableView自适应高度设置如下两个属性
    self.tableView.estimatedRowHeight=70;
    self.tableView.rowHeight=UITableViewAutomaticDimension;
    //设置tableView的内边距，使得内容向下移动
    self.tableView.contentInset=UIEdgeInsetsMake(64, 0, 0, 0);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeKeyboard:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)openKeyboard:(NSNotification *)noti
{
    CGRect keyboardFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    int options = [noti.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    NSTimeInterval duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    self.inputViewBottomConstraint.constant = keyboardFrame.size.height;
    [UIView animateWithDuration:duration delay:0 options:options animations:^{
        [self.view layoutIfNeeded];
       //键盘弹起后，表视图滚动到最后一行
        [self scrollToTableViewLastRow];
    } completion:nil];
    
}

- (void)closeKeyboard:(NSNotification *)noti
{
    int options = [noti.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    NSTimeInterval duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    self.inputViewBottomConstraint.constant = 0;
    [UIView animateWithDuration:duration delay:0 options:options animations:^{
        [self.view layoutIfNeeded];
        [self scrollToTableViewLastRow];
    } completion:nil];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

//控制表视图滚动到最底部
-(void)scrollToTableViewLastRow
{

    NSIndexPath *lastIndexPath=[NSIndexPath indexPathForRow:self.allMessages.count-1 inSection:0];
    //表视图滚动到最后一行
    [self.tableView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];

}
//点击右下角，返回按键
- (IBAction)clickReturn:(id)sender {
    NSString *newContent=self.textField.text;
    if (newContent.length==0) {
        return;
    }
    Message *newMessage=[[Message alloc] init];
    newMessage.content=newContent;
    newMessage.fromMe=YES;
    //记录数据到allMessages中
    [self.allMessages addObject:newMessage];
    self.textField.text=@"";
    
    
    //只针对新的数据，增加一行
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:self.allMessages.count-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self scrollToTableViewLastRow];

}

@end
