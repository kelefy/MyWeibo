//
//  AccessTokenModel.m
//  MyWeibo
//
//  Created by cracker on 15/9/5.
//  Copyright (c) 2015年 cracker. All rights reserved.
//

#import "AccessTokenModel.h"

@implementation AccessTokenModel

+(id)accessTokenModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}


-(id)initWithDict:(NSDictionary *)dict
{
    if(self = [super init])
    {
        self.access_token = [dict objectForKey:@"access_token"];
        self.expires_in = [dict objectForKey:@"expires_in"];;
        self.remind_in = [dict objectForKey:@"remind_in"];
        self.uid = [dict objectForKey:@"uid"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.access_token forKey:@"access_token"];
    [coder encodeObject:self.expires_in forKey:@"expires_in"];
    [coder encodeObject:self.remind_in forKey:@"remind_in"];
    [coder encodeObject:self.uid forKey:@"uid"];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    if(self = [super init])
    {
        self.access_token = [coder decodeObjectForKey:@"access_token"];
        self.expires_in = [coder decodeObjectForKey:@"expires_in"];
        self.remind_in = [coder decodeObjectForKey:@"remind_in"];
        self.uid = [coder decodeObjectForKey:@"uid"];
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"access_token = %@\nexpires_in=%@\nremind_in=%@\nuid=%@",self.access_token,self.expires_in,self.remind_in,self.uid];
}

@end
