//
//  UIViewController+navigationBar.m
//  ColorChangeableNavigationBar
//
//  Created by Charles on 23/02/17.
//  Copyright © 2017 Charles. All rights reserved.
//

#import "UIViewController+navigationBar.h"
#import <objc/runtime.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

static CGFloat const navigationBarHeight = 64.0;

@implementation UIViewController (navigationBar)

- (UINavigationBar *)navigationBar
{
    return objc_getAssociatedObject(self, @selector(navigationBar));
}

- (void)setNavigationBar: (UINavigationBar *)naviBar
{
    objc_setAssociatedObject(self, @selector(navigationBar), naviBar, OBJC_ASSOCIATION_RETAIN);
}

- (UIColor *)navigationBarColor
{
    return objc_getAssociatedObject(self, @selector(navigationBarColor));
}

- (void)setNavigationBarColor:(UIColor *)navigationBarColor
{
    objc_setAssociatedObject(self, @selector(navigationBarColor), navigationBarColor, OBJC_ASSOCIATION_RETAIN);
    [self updateNavigationBarColor];
}

- (void)addFakeNavigationBar
{
    //Note: if self.edgesForExtendedLayout is UIRectEdgeNone, need to change the frame to (0, -64, SCREEN_WIDTH, navigationBarHeight)
    self.navigationBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, navigationBarHeight)];
    self.navigationBar.translucent = NO;
    self.navigationBar.barStyle = UINavigationBar.appearance.barStyle;
    self.navigationBar.shadowImage = [UIImage new];
    [self updateNavigationBarColor];
    
    //self.view.clipsToBounds = NO; //need only if self.edgesForExtendedLayout is UIRectEdgeNone
    
    [self.view addSubview:self.navigationBar];
}

- (void)updateNavigationBarColor
{
    if (self.navigationBarColor) {
        self.navigationBar.barTintColor = self.navigationBarColor;
        [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    } else {
        self.navigationBar.barTintColor = UINavigationBar.appearance.barTintColor;
        [self.navigationBar setBackgroundImage:[UINavigationBar.appearance backgroundImageForBarMetrics:UIBarMetricsDefault] forBarMetrics:UIBarMetricsDefault];
    }
}

@end