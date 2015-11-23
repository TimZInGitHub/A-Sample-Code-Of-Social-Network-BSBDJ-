//
//  TZTabBar.m
//  TZBSBDJ
//
//  Created by Tim.Z on 15/11/6.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "TZTabBar.h"
#import "UIView+TZCoordinateExtension.h"


@interface TZTabBar ()

@property (nonatomic, weak) UIButton *publishButton;

@end

@implementation TZTabBar

- (void)setSelectedItem:(UITabBarItem *)selectedItem
{
//    if (self.delegateSignal) {
//        [self.delegateSignal sendNext:selectedItem];
//    }
    [super setSelectedItem:selectedItem];
}

#pragma mark - lazyloading
- (UIButton *)publishButton
{
    if (_publishButton == nil) {
        
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        
        _publishButton = publishButton;
        
        TZFUNC;
    }
    return _publishButton;
}

#pragma mark - initialization
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonW = self.tz_width / 5;
    CGFloat buttonH = self.tz_height;
    
    CGFloat tabBarButtonY = 0;
    
    int taBarButtonIndex = 0;
    
    for (UIView *subview in self.subviews) {
        if (subview.class != NSClassFromString(@"UITabBarButton")) continue;
        
        CGFloat tabBarButtonX = taBarButtonIndex * buttonW;
        if (taBarButtonIndex > 1) {
            tabBarButtonX += buttonW;
        }
        subview.frame = CGRectMake(tabBarButtonX, tabBarButtonY, buttonW, buttonH);
        
        taBarButtonIndex++;
    }
    
    
    self.publishButton.tzMakeWidth(buttonW).tzMakeHeight(buttonH).tzMakeCenterX(self.tz_width * 0.5).tzMakeCenterY(self.tz_height *  0.5);
}

#pragma mark - click
- (void)publishClick
{
    TZFUNC
}

@end


