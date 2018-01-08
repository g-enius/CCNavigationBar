//
//  UIViewController+navigationBar.h
//  ColorChangeableNavigationBar
//
//  Created by Charles on 23/02/17.
//  Copyright © 2017 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (navigationBar)

- (UIView *)navigationBar;
- (void)setNavigationBar: (UIView *)naviBar;
- (UIColor *)navigationBarColor;
- (void)setNavigationBarColor:(UIColor *)navigationBarColor;
- (void)addFakeNavigationBar;
- (void)updateNavigationBarColor;

@end
