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