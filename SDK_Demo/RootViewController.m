//
//  RootViewController.m
//  stonematrix
//
//  Created by Stone on 2018/11/19.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "RootViewController.h"
#import "DQNavViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"

@interface RootViewController ()<UITabBarControllerDelegate>
//@property (nonatomic, strong) User *user_model;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    //    self.user_model = getUserProfile();
    
    // 我在尝试用Sourcetree修改用户名
    // 我找到了修改用户名的方法
    // 我用公司账户可以提交我自己Github账户的代码 奇怪?

    [self setSubViews];
    
}

-(void)setSubViews
{
    //
    OneViewController * mainVC = [[OneViewController alloc] init];
    DQNavViewController * NC1 = [[DQNavViewController alloc] initWithRootViewController:mainVC];
    
    TwoViewController *VC2 = [[TwoViewController alloc] init];
    DQNavViewController *NC2 = [[DQNavViewController alloc] initWithRootViewController:VC2];
    NC2.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"me@2x"] selectedImage:[UIImage imageNamed:@"me@2x"]];
    self.viewControllers = @[NC1,NC2];
    
}


@end
