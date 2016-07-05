//
//  ViewController.m
//  Demo04-XML-SAX
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSXMLParserDelegate>

//xmlData
@property(nonatomic,strong) NSData *xmlData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *xmlPath=[[NSBundle mainBundle] pathForResource:@"Party" ofType:@"xml"];
    self.xmlData=[[NSData alloc] initWithContentsOfFile:xmlPath];
    
    //1.创建NSXMLParser对象
    NSXMLParser *parser=[[NSXMLParser alloc] initWithData:self.xmlData];
    //2.设置代理
    parser.delegate=self;
    //3.执行解析动作
    [parser parse];
    
}

#pragma mark---NSXMLParserDelegate

//文档开始
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"文档开始解析");
}
//解析元素开始
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    NSLog(@"已经解析到元素:%@",elementName);
    NSLog(@"该元素的属性:%@",attributeDict);
}
//获取元素的内容
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"该元素的内容:%@",string);
}

//解析元素结束
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"该元素解析结束:%@",elementName);
}

//文档结束
-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"整个文档解析结束");
}

@end
