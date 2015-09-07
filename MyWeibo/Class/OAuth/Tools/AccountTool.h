//
//  AccountTool.h
//  MyWeibo
//
//  Created by cracker on 15/9/5.
//  Copyright (c) 2015年 cracker. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AccessTokenModel;

@interface AccountTool : NSObject


+(void)writeAccountToFile:(AccessTokenModel *)model;
+(id)accountWithFile;

@end
