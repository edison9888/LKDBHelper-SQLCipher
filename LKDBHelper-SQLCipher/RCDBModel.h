//
//  RCDBModel.h
//  LKDBHelper-SQLCipher
//
//  Created by razeen on 12/28/15.
//  Copyright © 2015 razeen. All rights reserved.
//

#import "LKDBHelper.h"
#import <Foundation/Foundation.h>

@interface RCDBModel : NSObject

@property (assign, nonatomic)int RZID;
@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *account;
@property (strong, nonatomic)NSString *password;

@end

