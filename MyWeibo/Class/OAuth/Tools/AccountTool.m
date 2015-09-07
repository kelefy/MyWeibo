//
//  AccountTool.m
//  MyWeibo
//
//  Created by cracker on 15/9/5.
//  Copyright (c) 2015年 cracker. All rights reserved.
//

#import "AccountTool.h"
#import "AccessTokenModel.h"

@interface AccountTool()

@property (nonatomic,strong) NSString *path;

@end

@implementation AccountTool

+(void)writeAccountToFile:(AccessTokenModel *)model
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths lastObject];
    path = [path stringByAppendingPathComponent:@"userinfo.plist"];
    [NSKeyedArchiver archiveRootObject:model toFile:path];
}

+(id)accountWithFile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths lastObject];
    path = [path stringByAppendingPathComponent:@"userinfo.plist"];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

@end
