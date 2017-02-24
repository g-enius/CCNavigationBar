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
    self.delegate = (id<UINavigationControllerDelegate>) self;
    
    self.navigationBar.titleTextAttributes = UINavigationBar.appearance.titleTextAttributes;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers
{
    [super setViewControllers:viewControllers];
    UIViewController *topViewController = viewControllers.lastObject;
    
    if (!topViewController.navigationBar) {
        [topViewController addFackeNavigationBar];
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(!viewController.navigationBar) {
        [viewController addFackeNavigationBar];
    }
}

@end
