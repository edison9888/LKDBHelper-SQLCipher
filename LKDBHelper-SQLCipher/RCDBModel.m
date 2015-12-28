//
//  RCDBModel.m
//  LKDBHelper-SQLCipher
//
//  Created by razeen on 12/28/15.
//  Copyright © 2015 razeen. All rights reserved.
//

#import "RCDBModel.h"

@implementation RCDBModel

+ (LKDBHelper *)getUsingLKDBHelper{
    
    static LKDBHelper *db;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        NSString* dbpath = [NSHomeDirectory() stringByAppendingPathComponent:@"userDB/text.db"];
        db = [[LKDBHelper alloc]initWithDBPath:dbpath];
        
        NSLog(@"dbpath:%@",dbpath);
    });
    
    return db;
}



@end
