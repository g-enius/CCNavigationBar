//
//  UIViewController+navigationBar.h
//  ColorChangeableNavigationBar
//
//  Created by Charles on 23/02/17.
//  Copyright © 2017 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (navigationBar)

- (UIView *)navigationBarView;
- (void)setNavigationBarView: (UIView *)naviBarView;
- (UIColor *)navigationBarViewColor;
- (void)setNavigationBarViewColor:(UIColor *)navigationBarViewColor;
- (void)addFakeNavigationBarView;
- (void)updateNavigationBarViewColor;
- (void)updateNavigationBarViewFrame;

@end

