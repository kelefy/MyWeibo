//
//  AccessTokenModel.h
//  MyWeibo
//
//  Created by cracker on 15/9/5.
//  Copyright (c) 2015年 cracker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccessTokenModel : NSObject<NSCoding>

@property (nonatomic,copy) NSString *access_token;
@property (nonatomic,copy) NSString *expires_in;
@property (nonatomic,copy) NSString *remind_in;
@property (nonatomic,copy) NSString *uid;

+(id)accessTokenModelWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;
@end
