//
//  DQNavViewController.m
//  stonematrix
//
//  Created by Stone on 2018/11/19.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "DQNavViewController.h"

@interface DQNavViewController ()<UINavigationControllerDelegate>

@end

@implementation DQNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置代理
    self.delegate = self;
    
    __weak typeof(self)weakSelf = self;
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        
    }
    
    
    
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    // 非根控制器
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
    //    viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem ]
    
}


-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

//
+ (void)initialize {
    
    [[UITabBar appearance] setTranslucent:NO];
    
    [UINavigationBar appearance].barTintColor = [UIColor whiteColor];
    
    //设置导航栏颜色和字体颜色
    //    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"购物车导航icon"] forBarMetrics:UIBarMetricsDefault];
    
    
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    [[UINavigationBar appearance] setTitleTextAttributes:dict];
    
    
    //    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    
    // 设置导航条前景色 (设置返回键颜色)
    //    [bar setTintColor:[UIColor whiteColor]];
    //
    ////    // 获取导航条按钮的标识
    //    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    //
    //    // 修改返回按钮标题的位置
    //    [item setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -1000) forBarMetrics:UIBarMetricsDefault];
    
    
    //    [[UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]] setTitleTextAttributes:@{NSForegroundColorAttributeName:kColor(58, 59, 60)} forState:UIControlStateSelected];
    
}

- (void)backviewController {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
