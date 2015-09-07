//
//  User.h
//  MyWeibo
//
//  Created by cracker on 15/9/7.
//  Copyright (c) 2015年 cracker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic,copy) NSString *idstr;
@property (nonatomic,copy) NSString *screen_name;
@property (nonatomic,copy) NSString *name;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
+(instancetype)userWithDictioanry:(NSDictionary *)dictionary;

@end
