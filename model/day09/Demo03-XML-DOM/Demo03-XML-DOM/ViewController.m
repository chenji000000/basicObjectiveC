//
//  ViewController.m
//  Demo03-XML-DOM
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "GDataXMLNode.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //数据来源Party.xml
    NSString *partyPath=[[NSBundle mainBundle] pathForResource:@"Party" ofType:@"xml"];
    NSData *partyData=[[NSData alloc] initWithContentsOfFile:partyPath];
    
    //GDataXMLDocument和xml文件
    GDataXMLDocument *document=[[GDataXMLDocument alloc] initWithData:partyData options:0 error:nil];
    //GDataXMLElement和根元素绑定
    GDataXMLElement *rootElement=document.rootElement;
    //获取Player元素
    NSArray *playerArray=[rootElement elementsForName:@"Player"];
    for (GDataXMLElement *playerElement in playerArray) {
        NSArray *nameArray=[playerElement elementsForName:@"name"];
        GDataXMLElement *nameElement=(GDataXMLElement *)nameArray[0];
        NSString *nameStr=nameElement.stringValue;
        NSLog(@"name:%@",nameStr);
        
        //class
        NSArray *classArray=[playerElement elementsForName:@"class"];
        GDataXMLElement *classElement=(GDataXMLElement *)classArray[0];
        NSLog(@"class:%@",classElement.stringValue);
    }
}




@end
