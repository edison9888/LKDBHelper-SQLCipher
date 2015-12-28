//
//  ViewController.m
//  LKDBHelper-SQLCipher
//
//  Created by razeen on 12/28/15.
//  Copyright © 2015 razeen. All rights reserved.
//

#import "RCDBModel.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self text];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)text{
    
    //初始化数据库
    
    //1.写在model的类方法初始化
    LKDBHelper *globalHelper = [RCDBModel getUsingLKDBHelper];
    
/*   1.初始化使用默认的数据库
     LKDBHelper *globalHelper = [[LKDBHelper alloc]init];
     2.自己给定名字，保存默认路径
     LKDBHelper *globalHelper = [[LKDBHelper alloc]initWithDBName:@"text2.db"];
     3.自己给定路径(MODEL里的方法相同)
     NSString* dbpath = [NSHomeDirectory() stringByAppendingPathComponent:@"userDB/text.db"];
     LKDBHelper *globalHelper = [[LKDBHelper alloc]initWithDBPath:dbpath];
*/

    //删除所用表
    //[globalHelper dropAllTable];
    
    
    //清空表数据
    [LKDBHelper clearTableData:[RCDBModel class]];
    
    
    //初始化model
    RCDBModel *model = [[RCDBModel alloc]init];
    
    model.name = @"razeen";
    model.account = @"6216129099320001";
    model.password = @"123456";
    
    //保存数据
    [model saveToDB];
    
    //修改插入
    model.RZID = 90;
    [globalHelper insertToDB:model];

}

@end
