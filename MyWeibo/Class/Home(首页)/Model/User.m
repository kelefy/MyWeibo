//
//  User.m
//  MyWeibo
//
//  Created by cracker on 15/9/7.
//  Copyright (c) 2015年 cracker. All rights reserved.
//

#import "User.h"

@implementation User

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(self)
    {
        self.idstr = dictionary[@"idstr"];
        self.name = dictionary[@"name"];
        self.screen_name = dictionary[@"screen_name"];
    }
    return self;
}


+(instancetype)userWithDictioanry:(NSDictionary *)dictionary
{
    return [[self alloc]initWithDictionary:dictionary];
}

@end
