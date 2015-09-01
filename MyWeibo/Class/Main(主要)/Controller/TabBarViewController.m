//
//  TabBarViewController.m
//  MyWeibo
//
//  Created by cracker on 15/8/29.
//  Copyright (c) 2015年 cracker. All rights reserved.
//

#import "NavigationViewController.h"
#import "TabBarViewController.h"
#import "HomeTableViewController.h"
#import "MessageCenterTableViewController.h"
#import "DiscoverTableViewController.h"
#import "ProfileTableViewController.h"
#import "MyTabbar.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //首页
    HomeTableViewController *home = [[HomeTableViewController alloc]init];
    [self addChildWithController:home title:@"首页" imageName:@"tabbar_home" imgSelectedName:@"tabbar_home_selected"];
    
    //消息
    MessageCenterTableViewController *message = [[MessageCenterTableViewController alloc]init];
    [self addChildWithController:message title:@"消息" imageName:@"tabbar_message_center" imgSelectedName:@"tabbar_message_center_selected"];
    
    //广场
    DiscoverTableViewController *guangchang = [[DiscoverTableViewController alloc]init];
    [self addChildWithController:guangchang title:@"广场" imageName:@"tabbar_discover" imgSelectedName:@"tabbar_discover_selected"];
    
    //我
    ProfileTableViewController *wo = [[ProfileTableViewController alloc]init];
    [self addChildWithController:wo title:@"我" imageName:@"tabbar_profile" imgSelectedName:@"tabbar_profile_selected"];
    
    MyTabbar *myTab = [[MyTabbar alloc]init];
    [self setValue:myTab forKey:@"tabBar"];
    
}

-(void)addChildWithController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imgName imgSelectedName:(NSString *)imgSelectedName
{
//    HomeTableViewController *home = [[HomeTableViewController alloc]init];
//    childVc.tabBarItem.title = title;
//    childVc.navigationItem.title = title;
    childVc.title = title;
    
    childVc.tabBarItem.image = [UIImage imageNamed:imgName];
    UIImage *homeSelected = [UIImage imageNamed:imgSelectedName];
    //组织tab控制器进行渲染图片
    homeSelected = [homeSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = homeSelected;
    //修改字体颜色
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = [UIColor blackColor];
    [childVc.tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    
    NavigationViewController *navi = [[NavigationViewController alloc]initWithRootViewController:childVc];
    [self addChildViewController:navi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
