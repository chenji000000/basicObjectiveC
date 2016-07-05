//
//  BViewController.m
//  星座运程
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *constellationButton;

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    }
    

- (IBAction)goBack:(id)sender {
    
    [self.delegate bViewController:self didFinishInput:[self.constellationButton indexOfObject:sender]];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
