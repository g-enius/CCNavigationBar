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

@implementation UIViewController (navigationBar)

- (UIView *)navigationBarView
{
    return objc_getAssociatedObject(self, @selector(navigationBarView));
}

- (void)setNavigationBarView: (UIView *)naviBarView
{
    objc_setAssociatedObject(self, @selector(navigationBarView), naviBarView, OBJC_ASSOCIATION_RETAIN);
}

- (UIColor *)navigationBarViewColor
{
    return objc_getAssociatedObject(self, @selector(navigationBarViewColor));
}

- (void)setNavigationBarViewColor:(UIColor *)navigationBarViewColor
{
    objc_setAssociatedObject(self, @selector(navigationBarViewColor), navigationBarViewColor, OBJC_ASSOCIATION_RETAIN);
    [self updateNavigationBarViewColor];
}

- (void)updateNavigationBarViewFrame {
    CGFloat height;
    if ([self isLandscape]) {
        if ([self isIphoneX]) {
            height = 32; //iPhoneX couldn't control status bar!
        } else {
            height = [self isStatusBarHidden] ? 44 : 64;
        }
    } else {
        height = [self isIphoneX] ? 88.0 : 64.0;
    }
    
    self.navigationBarView.frame = CGRectMake(0, -height, SCREEN_WIDTH, height);
    
//    NSLog(@"%@ updateNavigationBarFrame: %@, %@", self, self.navigationBarView, NSStringFromCGRect(self.navigationBarView.frame));
}

- (void)addFakeNavigationBarView
{
    //Note: if self.edgesForExtendedLayout is UIRectEdgeAll, need to change the frame to (0, 0, SCREEN_WIDTH, navigationBarHeight)
    
    self.navigationBarView = [UIView new];
    [self.view addSubview:self.navigationBarView];
    
    [self updateNavigationBarViewFrame];
    [self updateNavigationBarViewColor];
    
    //If your app targets iOS 9.0 and later or macOS 10.11 and later, you don't need to unregister an observer in its dealloc method.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateNavigationBarViewFrame) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)updateNavigationBarViewColor
{
    if (self.navigationBarViewColor) {
        self.navigationBarView.backgroundColor = self.navigationBarViewColor;
    } else {
        self.navigationBarView.backgroundColor = UINavigationBar.appearance.barTintColor;
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
    return UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
}

- (BOOL)isStatusBarHidden {
    return [UIApplication sharedApplication].statusBarHidden;
}

@end

