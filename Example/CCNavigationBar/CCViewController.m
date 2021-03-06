//
//  CCViewController.m
//  CCNavigationBar
//
//  Created by g-enius on 02/24/2017.
//  Copyright (c) 2017 g-enius. All rights reserved.
//

#import "CCViewController.h"
#import "UIViewController+navigationBar.h"
#define randomFloat arc4random() % 255 / 255.

static NSString * titleString = @"Tap To Push";

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Note: it's critical to get right navigation bar
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationBarViewColor = [UIColor lightGrayColor];
    self.title = titleString;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushNewVC:)];
    [self.view addGestureRecognizer:tap];
}

- (void)pushNewVC:(UITapGestureRecognizer *)sender
{
    UIViewController *newViewController = [UIViewController new];
    newViewController.edgesForExtendedLayout = UIRectEdgeNone;
    newViewController.title = titleString;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushNewVC:)];
    [newViewController.view addGestureRecognizer:tap];
    
    UIColor *randomColor = [UIColor colorWithRed:randomFloat green:randomFloat blue:randomFloat alpha:1];
    newViewController.view.backgroundColor = [UIColor whiteColor];
    newViewController.navigationBarViewColor = randomColor;
    [self.navigationController pushViewController:newViewController animated:YES];
}

- (BOOL)prefersStatusBarHidden {
    return YES; //iPhoneX couldn't control status bar!
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
