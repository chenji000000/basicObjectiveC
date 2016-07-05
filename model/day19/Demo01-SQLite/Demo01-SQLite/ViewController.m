//
//  ViewController.m
//  Demo01-SQLite
//
//  Created by tarena on 15/11/27.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建数据库（文件）xxx/Documents/database.sqlite
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *databasePath = [documentsPath stringByAppendingPathComponent:@"database.sqlite"];
    //如果没有数据库文件，自动创建；如果有，就自动打开
    sqlite3 *db;
    int ret = sqlite3_open([databasePath cStringUsingEncoding:NSUTF8StringEncoding], &db);
    if (ret != SQLITE_OK) {
        NSLog(@"创建数据库失败:%s", sqlite3_errmsg(db));
    }
    //2.创建表(SQL语句)
    const char *createTable = "create table if not exists people (id integer primary key, name text, age integer, height real)";
    char *errmsg=NULL;
    ret = sqlite3_exec(db, createTable, NULL, NULL, &errmsg);
    if (ret != SQLITE_OK) {
        NSLog(@"创建表失败:%s",errmsg);
    }
    //3.增/改/查
    const char *insertData = "insert into people (name, age, height) values ('Jonny', 19, 1.85)";
    ret = sqlite3_exec(db, insertData, NULL, NULL, &errmsg);
    if (ret != SQLITE_OK) {
        NSLog(@"插入数据失败:%s", errmsg);
    }
    
    const char *updateData = "update people set height=1.8 where name='Jonny'";
    ret = sqlite3_exec(db, updateData, NULL, NULL, &errmsg);
    if (ret != SQLITE_OK) {
        NSLog(@"更新数据失败:%s",errmsg);
    }
   //查找
    const char *query = "select * from people";
    sqlite3_stmt *stmt;
    ret = sqlite3_prepare_v2(db, query, -1, &stmt, NULL);
    if (ret == SQLITE_OK) {
        
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            //从stmt中取数据(按照不同的类型，使用不同的方法)
            //name(第二个参数：指定数据在表的列数)
            char *name = (char *)sqlite3_column_text(stmt, 1);
            //age
            int age = sqlite3_column_int(stmt, 2);
            //height
            double height = sqlite3_column_double(stmt, 3);
            NSLog(@"name:%s,age:%d,height:%f", name, age, height);
        }
        //释放stmt变量的内存
        sqlite3_finalize(stmt);
    }
    //收尾工作(断开和数据库的连接)
    sqlite3_close(db);
    
    
    
}



@end
