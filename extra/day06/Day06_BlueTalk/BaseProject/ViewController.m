//
//  ViewController.m
//  BaseProject
//
//  Created by tarena on 15/12/15.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "NewsNetManager.h"
#import "Message.h"

/* 专门用于蓝牙通讯的框架 */
@import MultipeerConnectivity;
/* 必须了解的基础知识
 MCAdvertiserAssistant 可以接受数据，并处理用户请求连接的响应，没有回调，会弹出默认的提示框，并处理连接
 MCNearbyServiceAdvertiser 可以接受数据，并处理用户请求连接的响应，但是这个类有回调，告知有用户要与你的设别连接，可以自定义提示框，以及连接处理
 MCNearbyServiceBrowser 用于搜索附近用户，并且可以对搜索到的用户发出邀请,加入到某个会话中
 MCPeerID 这是用户信息
 MCSession 启动和管理会话中的交流，发送数据
 
 */

#define kReceiveCell  @"ReceiveCell"
#define kSendCell  @"SendCell"
/** 蓝牙服务类型， 用于区分 */
#define kServiceType @"MyServiceType"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, MCNearbyServiceAdvertiserDelegate, MCSessionDelegate, MCBrowserViewControllerDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLayoutConstraint;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** 用于广播自己，让别人可以发现你，并且连接 */
@property (nonatomic, strong) MCNearbyServiceAdvertiser *advertiser;
/** 当前用户的信息，本机用户信息 */
@property (nonatomic, strong) MCPeerID *peerID;
/** 对方信息 */
@property (nonatomic, copy) MCPeerID *otherPeerID;
/** 会话：信息的传递 */
@property (nonatomic, strong) MCSession *seesion;
/** 搜索附近的蓝牙用户 */
@property (nonatomic, strong) MCNearbyServiceBrowser *browser;
/** 搜索附近蓝牙用户的界面，视图控制器 */
@property (nonatomic, strong) MCBrowserViewController *browserVC;
/** 用于存放收发的信息 */
@property (nonatomic, strong) NSMutableArray *messageList;
@end

@implementation ViewController

- (NSMutableArray *)messageList
{
    if (_messageList) {
        _messageList = [NSMutableArray new];
    }
    return _messageList;
}

#pragma mark---创建自己信息
- (MCPeerID *)peerID
{
    if (!_peerID) {
        _peerID = [[MCPeerID alloc] initWithDisplayName:@"lala"];
    }
    return _peerID;
}

#pragma mark---广播自己，让别人发现
- (MCNearbyServiceAdvertiser *)advertiser{
    if (!_advertiser) {
        _advertiser = [[MCNearbyServiceAdvertiser alloc] initWithPeer:self.peerID discoveryInfo:nil serviceType:kServiceType];
        _advertiser.delegate = self;
    }
    return _advertiser;
}
/* 当别人请求连接时，触发 */
- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didReceiveInvitationFromPeer:(MCPeerID *)peerID withContext:(NSData *)context invitationHandler:(void (^)(BOOL, MCSession * _Nonnull))invitationHandler
{
    DDLogVerbose(@"didReceiveInvitationFromPeer");
    DDLogVerbose(@"收到了来自 %@ 的邀请",peerID.displayName);
    NSString *message = [NSString stringWithFormat:@"收到了来自 %@ 的邀请",peerID.displayName];
    [self showAlert:message];
    //将YES代表同意邀请，使用Session对象来保存这个邀请
    invitationHandler(YES, self.seesion);
    
}


#pragma mark---表格的协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    NSString *identify = kReceiveCell;
    Message *message = self.messageList[indexPath.row];
    if (message.fromMe) {
        identify = kSendCell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    UILabel *contentLb = (UILabel *)[cell.contentView viewWithTag:100];
    contentLb.text = message.content;
    /* 添加圆角 */
    contentLb.layer.cornerRadius = 10;
    contentLb.layer.masksToBounds = YES;
    return cell;
}
//根据cell中的内容 自动适配高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

#pragma mark--蓝牙会话操作
- (MCSession *)seesion
{
    /**
     *  参数2：加密
     */
    if (!_seesion) {
        _seesion = [[MCSession alloc] initWithPeer:self.peerID securityIdentity:nil encryptionPreference:MCEncryptionNone];
        _seesion.delegate = self;
    }
    return _seesion;
}

/** 当会话状态发生变化时 触发，正在连接 连接上 断开连接 */
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{
    DDLogVerbose(@"didChangeState");
    switch (state) {
        case MCSessionStateConnected:
            [self showAlert:@"已连接"];
            self.title = peerID.displayName;
            break;
        case MCSessionStateConnecting:
            [self showAlert:@"正在连接"];
            self.title = @"正在连接";
            break;
        case MCSessionStateNotConnected:
            [self showAlert:@"已断开"];
            self.title = @"已断开";
            break;
        default:
            break;
    }
}
/** 收到数据 */
- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"didReceiveData from %@:%@", peerID.displayName, str);
    Message *message = [Message new];
    message.fromMe = NO;
    message.content = str;
    [self.messageList addObject:message];
    //收信息，是在分线程中执行的，需要在主线程中刷新界面
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [_tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.messageList.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationBottom];
    }];
}
/** 当会话请求连接时 */
- (void)session:(MCSession *)session didReceiveCertificate:(NSArray *)certificate fromPeer:(MCPeerID *)peerID certificateHandler:(void (^)(BOOL))certificateHandler
{
    NSLog(@"didReceiveCertificate");
    
    //这个方法是在多线程触发的
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [UIAlertView bk_showAlertViewWithTitle:peerID.displayName message:@"是否接受此人的邀请？" cancelButtonTitle:@"拒绝" otherButtonTitles:@[@"接受"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 1) {
                certificateHandler(YES);
                self.otherPeerID = peerID;
                [_browserVC dismissViewControllerAnimated:YES completion:nil];
            } else {
                certificateHandler(NO);
            }
        }];
    }];
    
}

#pragma mark---用户点击操作
//搜索设备
- (IBAction)searchDevices:(id)sender {
    /*
    参数1：搜索的服务类型
     参数2：搜索到以后，创建会话
     */
    _browserVC = [[MCBrowserViewController alloc] initWithServiceType:kServiceType session:self.seesion];
    /* 这个控制器需要使用代理 来完成取消和完成操作 */
    _browserVC.delegate = self;
    [self presentViewController:_browserVC animated:YES completion:nil];
}
/* 点击完成按钮触发 */
- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
    [browserViewController dismissViewControllerAnimated:YES completion:nil];
}
/* 点击取消按钮触发 */
- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{
   [browserViewController dismissViewControllerAnimated:YES completion:nil];
}

//打开天线
- (IBAction)showSelf:(id)sender {
    [self.advertiser startAdvertisingPeer];
}


//发送按钮被点击
- (IBAction)sendTextField:(id)sender {
    [self.view endEditing:YES];//收键盘
    if (_textField.text.length == 0) {
        [self showAlert:@"内容为空！"];
        return;
    }
    NSData *data = [_textField.text dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    
    [self.seesion sendData:data toPeers:@[_otherPeerID] withMode:MCSessionSendDataReliable error:&error];
    if (error) {
        DDLogError(@"error %@", error);
    } else {
        DDLogVerbose(@"发送成功");
        Message *message = [Message new];
        message.fromMe = YES;
        message.content = _textField.text;
        [self.messageList addObject:message];
        _textField.text = @"";
        [_tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.messageList.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationBottom];
       

    }
}
#pragma mark---键盘弹出和隐藏动画
/* 键盘弹出 */
- (void)keyboardWillShow:(NSNotification *)noti{
    //键盘高度
    CGFloat height = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    //动画时长
    NSTimeInterval duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //动画方式, cmd+shift+k弹出键盘
    UIViewAnimationOptions option = [noti.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        _bottomLayoutConstraint.constant = height;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}
/* 键盘隐藏 */
- (void)keyboardWillHide:(NSNotification *)noti{
    
    //动画时长
    NSTimeInterval duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //动画方式, cmd+shift+k弹出键盘
    UIViewAnimationOptions option = [noti.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        _bottomLayoutConstraint.constant = 0;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}
#pragma mark---生命周期
/* 监听键盘的弹出操作，做动画 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
