//
//  AppDelegate.m
//  MyWeibo
//
//  Created by cracker on 15/8/29.
//  Copyright (c) 2015年 cracker. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "NewFeatureViewController.h"
#import "AccountTool.h"
#import "AccessTokenModel.h"
#import "AuthViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建主窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathUserinfo = [paths lastObject];
    pathUserinfo = [pathUserinfo stringByAppendingPathComponent:@"userinfo.plist"];
    AccessTokenModel *model = [AccountTool accountWithFile];
    if(model)
    {
#ifdef DEBUG
        NSLog(@"%@",model);
#endif
        //获取当前版本
        NSDictionary *dic = [NSBundle mainBundle].infoDictionary;
        NSMutableDictionary *versionDictionary = [NSMutableDictionary dictionary];
        versionDictionary[@"CFBundleVersion"] = dic[@"CFBundleVersion"];
        
        NSString *path = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),@"Documents/version.plist"];
        NSLog(@"%@",path);
        NSMutableDictionary *oldVersionDic;
        if([[NSFileManager defaultManager]fileExistsAtPath:path])
        {
            oldVersionDic = [NSMutableDictionary dictionaryWithContentsOfFile:path];
        }
        else
        {
            oldVersionDic = [NSMutableDictionary dictionary];
        }
        NSString *strOldVersion = oldVersionDic[@"version"];
        if(![strOldVersion isEqual:dic[@"CFBundleVersion"]])
        {
            oldVersionDic[@"version"] = dic[@"CFBundleVersion"];
            NSLog(@"版本不同");
            [oldVersionDic writeToFile:path atomically:NO];
            self.window.rootViewController = [NewFeatureViewController new];
        }
        else
        {
            NSLog(@"版本相同");
            self.window.rootViewController = [TabBarViewController new];
        }

//        NSLog(@"%@",pathUserinfo);
        
    }
    else
    {
        self.window.rootViewController = [AuthViewController new];
    }
    
    
    //[TabBarViewController new];//[[NewFeatureViewController alloc]init];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
