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


    
    

    
    
    //-----------增
    
    //初始化model
    RCDBModel *model = [[RCDBModel alloc]init];
    
    model.name = @"razeen";
    model.account = @"6216129099320001";
    model.password = @"123456";
    
    //保存数据
    [model saveToDB];
    
    
    //第二张表
    RCDB2Model *model2 = [[RCDB2Model alloc]init];
    
    model2.adress = @"shanghai";
    model2.num = @"88888";
    
    [model2 saveToDB];
    
    RCDB2Model *model3 = [[RCDB2Model alloc]init];
    
    model3.adress = @"beijing";
    model3.num = @"99999";
    
    [model3 saveToDB];
    

    //----------删
    model2.rowid = 1;
    BOOL isHas = [globalHelper isExistsModel:model2];
    if (isHas) {
        
        [globalHelper deleteToDB:model2];
        
    }
    
    //删除所有表mm
//    [globalHelper dropAllTable];
    
    //清空表数据
//    [LKDBHelper clearTableData:[RCDBModel class]];
    
    //---------改
    //修改插入
    model.rowid = 3;
    model.RZID = 100;
    [globalHelper insertToDB:model];
    
    RCDBModel *model4 = [[RCDBModel alloc]init];
    model4.name = @"jack";
    model4.account = @"7748742412412";
    model4.password = @"123456";
    [globalHelper insertToDB:model4 callback:^(BOOL result) {
        NSLog(@"line: %d result: %d",__LINE__,result);
    }];
    
    //--------查
    
    //利用SQL语句查
    NSMutableArray *resultArray = [globalHelper searchWithSQL:@"select * from @t" toClass:[RCDBModel class]];
    for (RCDBModel *resultmodel in resultArray) {
        
        NSLog(@"line: %d resultModel: %@",__LINE__,resultmodel);
    }
    
    //查所有值
    NSMutableArray *allArray = [RCDB2Model searchColumn:nil where:nil orderBy:nil offset:0 count:50];
    for (RCDB2Model *allModle in allArray) {
        
        NSLog(@"line: %d allModel: %@",__LINE__, allModle);
    }
    
    //查看某一列的值
    NSArray *columnArray = [RCDBModel searchColumn:@"name" where:nil orderBy:nil offset:0 count:0];
    for (RCDBModel *columnModel in columnArray) {
        
        NSLog(@"line: %d columnModel: %@",__LINE__,columnModel);
    }
    
    //异步查找
    [globalHelper search:[RCDBModel class] where:nil orderBy:nil offset:0 count:100 callback:^(NSMutableArray *array) {
        
        for (RCDBModel *BlockModel in array) {
            
            NSLog(@"line: %d BlockModel: %@",__LINE__,BlockModel);
        }
    }];
}

@end
