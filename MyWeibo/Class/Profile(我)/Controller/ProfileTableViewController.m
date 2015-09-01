//
//  ProfileTableViewController.m
//  MyWeibo
//
//  Created by cracker on 15/8/30.
//  Copyright (c) 2015年 cracker. All rights reserved.
//

#import "ProfileTableViewController.h"

@implementation ProfileTableViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    dict[NSForegroundColorAttributeName] = [UIColor orangeColor];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]init];
    [right setTitleTextAttributes:dict forState:UIControlStateNormal];
    right.title = @"设置";
    self.navigationItem.rightBarButtonItem = right;
}

@end
