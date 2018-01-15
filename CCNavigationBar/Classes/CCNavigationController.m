//
//  CCNavigationController.m
//  ColorChangeableNavigationBar
//
//  Created by Charles on 23/02/17.
//  Copyright © 2017 Charles. All rights reserved.
//

#import "CCNavigationController.h"
#import "UIViewController+navigationBar.h"

@interface CCNavigationController ()

@end

@implementation CCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.translucent = YES;
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];//otherwise will be a gray underline
    self.navigationBar.titleTextAttributes = UINavigationBar.appearance.titleTextAttributes;
    
    self.delegate = (id<UINavigationControllerDelegate>) self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.topViewController updateNavigationBarViewFrame];
}

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers
{
    [super setViewControllers:viewControllers];
    UIViewController *topViewController = viewControllers.lastObject;
    
    if (!topViewController.navigationBarView) {
        [topViewController addFakeNavigationBarView];
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(!viewController.navigationBarView) {
        [viewController addFakeNavigationBarView];
    }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return self.topViewController.supportedInterfaceOrientations;
}

@end
