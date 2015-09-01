//
//  MyTabbar.m
//  MyWeibo
//
//  Created by cracker on 15/8/30.
//  Copyright (c) 2015年 cracker. All rights reserved.
//

#import "MyTabbar.h"
#import "UIView+Extension.h"


@interface MyTabbar()

@property (nonatomic,weak) UIButton *plusButton;

@end

@implementation MyTabbar

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        UIButton *plusButton = [[UIButton alloc]init];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlight"] forState:UIControlStateSelected];
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlight"] forState:UIControlStateSelected];
        plusButton.width = plusButton.currentBackgroundImage.size.width;
        plusButton.height = plusButton.currentBackgroundImage.size.height;
        self.plusButton = plusButton;
        [self addSubview:plusButton];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.plusButton.centerX = self.width*0.5;
    self.plusButton.centerY = self.height*0.5;
    
    Class class = NSClassFromString(@"UITabBarButton");
    int index = 0;
    for(UIView *view in self.subviews)
    {
        if([view isKindOfClass:class])
        {
            view.x = self.width*0.2*index;
            index++;
        }
        if(index==2)
        {
            index++;
        }
    }
}

@end
