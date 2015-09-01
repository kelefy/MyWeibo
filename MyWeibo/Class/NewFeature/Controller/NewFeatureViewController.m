//
//  NewFeatureViewController.m
//  MyWeibo
//
//  Created by cracker on 15/8/30.
//  Copyright (c) 2015年 cracker. All rights reserved.
//

#import "NewFeatureViewController.h"
#import "UIView+Extension.h"
#import "TabBarViewController.h"

@interface NewFeatureViewController()<UIScrollViewDelegate>

@property(nonatomic,weak) UIScrollView *scrollView;
@property(nonatomic,weak) UIPageControl *pageControl;

@end

@implementation NewFeatureViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    self.scrollView = scrollView;
    scrollView.frame = self.view.bounds;
    NSArray *arrPicNames = [NSArray arrayWithObjects:@"new_feature_1",@"new_feature_2",@"new_feature_3",@"new_feature_4", nil];
    NSMutableArray *arrImageViews = [NSMutableArray array];
    for(NSString *picName in arrPicNames)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:picName]];
        imageView.width = self.view.width;
        imageView.height = self.view.height;
        [arrImageViews addObject:imageView];
    }
    
    UIImageView *lastImageView = [arrImageViews lastObject];
    lastImageView.userInteractionEnabled = YES;//允许与用户进行交互
    UIButton *login = [[UIButton alloc]init];
//    login.centerX = self.view.width*0.5;
    login.centerY = self.view.height-200;
    login.width = self.view.width;
    login.height = 50;
    [login setTitle:@"分享给大家" forState:UIControlStateNormal];
    [login setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [login setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [login addTarget:self action:@selector(shareButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [login setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lastImageView addSubview:login];
    
    UIButton *startBtn = [[UIButton alloc]init];
    startBtn.width=125;
    startBtn.height=36;
    startBtn.centerX = self.view.width*0.5;
    startBtn.centerY = self.view.height-100;
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [lastImageView addSubview:startBtn];
    
    
    
    
    
    for(int i = 0;i<arrImageViews.count;i++)
    {
        UIImageView *imgView = arrImageViews[i];
        imgView.x = self.view.width*i;
        [scrollView addSubview:imgView];
    }
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;//去掉弹簧
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(arrImageViews.count*self.view.width, self.view.height);
    [self.view addSubview:scrollView];
    
    UIPageControl *pageController = [[UIPageControl alloc]init];
    pageController.frame = CGRectMake(self.view.width/2-50, self.view.height-50, 100, 37);
    pageController.numberOfPages = arrImageViews.count;
    pageController.currentPageIndicatorTintColor = [UIColor orangeColor];
    pageController.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl = pageController;
    [self.view addSubview:pageController];
}

-(void)shareButtonClick:(UIButton *)button
{
    button.selected = !button.selected;
}

-(void)startButtonClick:(UIButton *)button
{
    TabBarViewController *tab = [[TabBarViewController alloc]init];
    for(UIView *view in self.view.subviews)
    {
        [view removeFromSuperview];
    }
    [self.view addSubview:tab.view];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint size = scrollView.contentOffset;
    int page = (size.x+self.view.width*0.5)/self.view.width;
    self.pageControl.currentPage = page;
}

@end
