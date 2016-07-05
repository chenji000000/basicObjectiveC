//
//  ViewController.m
//  Demo01-CoreData-Manual
//
//  Created by tarena on 15/11/28.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "People.h"

@interface ViewController ()
//被管理对象上下文
@property (nonatomic, strong) NSManagedObjectContext *context;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建上下文对象
    self.context = [NSManagedObjectContext new];
    //2.持久化存储协调器对象(数据模型文件的URL)
    //momd:编译之后的文件后缀
    NSURL *dataModalFileURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    NSManagedObjectModel *objectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:dataModalFileURL];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:objectModel];
    //3.持久化存储对象
    /*
     第一个参数：指定数据存储的类型：SQLite
     第二个参数：nil（默认使用数据库的设置：timeout/连接个数等）
     第三个参数：指定数据库文件的URL（自动创建数据库文件/Documents/sqlite.db）
     */
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *dbFilePath = [documentsPath stringByAppendingPathComponent:@"sqlite.db"];
    //fileURLWithPath本地路径
    //urlWithString网络
    NSError *error = nil;
    NSPersistentStore *store = [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:dbFilePath] options:nil error:&error];
    //4.设定类之间的联系
    [self.context setPersistentStoreCoordinator:coordinator];
    
}

- (IBAction)insertRecord:(id)sender {
    //insert into people (name,age,height) values ('Jonny',19,1.85);
//NSEntityDescription:描述实体的类
    //返回一个空的NSManagerObject对象
    People *people = [NSEntityDescription insertNewObjectForEntityForName:@"People" inManagedObjectContext:self.context];
    people.name = @"Jonny";
    people.age =@19;
    people.height = @1.85;
    //存储到数据库文件中
    NSError *error = nil;
    if (![self.context save:&error]) {
        NSLog(@"插入数据失败:%@",error.userInfo);
    }
    
}

- (IBAction)updateRecord:(id)sender {
    //update people set name='Maggie' where name='Jonny';
    //1.先找到名字叫Jonny得所有记录
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"People"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name='Jonny'"];
    request.predicate = predicate;
    NSError *error = nil;
    NSArray *peopleArray = [self.context executeFetchRequest:request error:&error];
    //2.再将找到记录的所有名字改成Maggie
    if (!error) {
        for (People *people in peopleArray) {
            people.name = @"Maggie";
        }
    }
    //3.使用上下文对象将更改的记录存储到数据库中
    if (![self.context save:&error]) {
        NSLog(@"更新失败:%@",error.userInfo);
    }
}

- (IBAction)queryRecord:(id)sender {
     //select * from people;
    //select * from people where name='Jonny';
    //select * from people where name='Jonny' order by height asc;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"People"];
    NSError *error = nil;
    
    //需求2：有条件的查询(谓词)
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name='Jonny'"];
    request.predicate = predicate;
    
    //需求3：有条件的查询，并且按照身高升序返回(排序描述算子)
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"height" ascending:YES];
    request.sortDescriptors = @[sort];
    
    NSArray *peopleArray = [self.context executeFetchRequest:request error:&error];
    if (!error) {
        //打印验证
        for (People *people in peopleArray) {
            NSLog(@"name:%@; age:%@; height:%@", people.name, people.age, people.height);
        }
    }
}

- (IBAction)deleteRecord:(id)sender {
    //delete from people where name='Maggie';
    //1.找到name是Maggie记录
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"People"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name='Maggie'"];
    request.predicate = predicate;
    NSArray *peopleArray = [self.context executeFetchRequest:request error:nil];
    //2.循环删除记录
    for (People *people in peopleArray) {
        //使用上下文对象删除（内存删除；和数据库文件无关）
        [self.context deleteObject:people];
    }
    //3.保存修改后的记录
    NSError *error = nil;
    if (![self.context save:&error]) {
        NSLog(@"删除失败:%@",error.userInfo);
    }
}







@end
