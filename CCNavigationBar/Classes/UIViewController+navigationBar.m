//
//  UIViewController+navigationBar.m
//  ColorChangeableNavigationBar
//
//  Created by Charles on 23/02/17.
//  Copyright © 2017 Charles. All rights reserved.
//

#import "UIViewController+navigationBar.h"
#import <objc/runtime.h>

@implementation UIViewController (navigationBar)

- (UIView *)navigationBar
{
    return objc_getAssociatedObject(self, @selector(navigationBar));
}

- (void)setNavigationBar: (UIView *)naviBar
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

- (void)updateNavigationBarFrame {
    CGFloat height;
    if ([self isLandscape]) {
        if ([self isIphoneX]) {
            height = 32; //iPhoneX Landscape couldn't show status bar!
        } else {
            height = self.prefersStatusBarHidden ? 44 : 64;
        }
    } else {
        height = [self isIphoneX] ? 88.0 : 64.0;
    }
    
    self.navigationBar.frame = CGRectMake(0, -height, SCREEN_WIDTH, height);
}

- (void)addFakeNavigationBar
{
    //Note: if self.edgesForExtendedLayout is UIRectEdgeAll, need to change the frame to (0, 0, SCREEN_WIDTH, navigationBarHeight)

    self.navigationBar = [UIView new];
    [self.view addSubview:self.navigationBar];

    [self updateNavigationBarFrame];
    [self updateNavigationBarColor];
    
    //If your app targets iOS 9.0 and later or macOS 10.11 and later, you don't need to unregister an observer in its dealloc method.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateNavigationBarFrame) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)updateNavigationBarColor
{
    if (self.navigationBarColor) {
        self.navigationBar.backgroundColor = self.navigationBarColor;
    } else {
        self.navigationBar.backgroundColor = UINavigationBar.appearance.barTintColor;
    }
}

- (BOOL)isIphoneX
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat width = MIN(screenSize.width, screenSize.height);
    CGFloat height = MAX(screenSize.width, screenSize.height);
    
    return (width == 375.0 && height == 812.0);
}

- (BOOL)isLandscape
{
    return UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation);
}

@end

