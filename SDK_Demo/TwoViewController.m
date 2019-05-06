//
//  TwoViewController.m
//  SDK_Demo
//
//  Created by M on 2019/2/28.
//  Copyright © 2019 Stone. All rights reserved.
//

#import "TwoViewController.h"
#import <AdTiming/AdTiming.h>

@interface TwoViewController ()<ADTNativeDelegate>

@property(nonatomic,strong)UIButton *NativeBtn;
@property(nonatomic,strong)UIButton *InteractiveBtn;
@property(nonatomic,strong)UIButton *BannerBtn;

@property (nonatomic, strong)ADTNativeAd *nativeAd;
@property (nonatomic, strong)ADTNative *native;

@property(nonatomic,strong)ADTNativeView *nativeView;
@property(nonatomic,strong)UIImageView *iconView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *bodyLabel;


@end


@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Two";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.native = [[ADTNative alloc]initWithPlacmentID:@"3551"];
    self.native.delegate = self;
    
    
    // NativeBtn
    _NativeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _NativeBtn.frame = CGRectMake(35, 20+64, 100, 50);
    [_NativeBtn setTitle:@"NativeBtn" forState:UIControlStateNormal];
    [_NativeBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    _NativeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _NativeBtn.backgroundColor = [UIColor whiteColor];
    _NativeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    _NativeBtn.layer.cornerRadius = 5;
    [_NativeBtn addTarget:self action:@selector(NativeBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_NativeBtn];
    
    
    // InteractiveBtn
    _InteractiveBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _InteractiveBtn.frame = CGRectMake(35, 40+64+30, 200, 50);
    [_InteractiveBtn setTitle:@"InteractiveAD" forState:UIControlStateNormal];
    [_InteractiveBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    _InteractiveBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _InteractiveBtn.backgroundColor = [UIColor whiteColor];
    _InteractiveBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    _InteractiveBtn.layer.cornerRadius = 5;
    [_InteractiveBtn addTarget:self action:@selector(InteractiveBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_InteractiveBtn];

}
- (ADTNativeView*)nativeView{
    if(!_nativeView){
        _nativeView = [[ADTNativeView alloc]initWithFrame:CGRectMake(0,300, self.view.frame.size.width, 300)];
        _nativeView.mediaView = [[ADTNativeMediaView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
        [_nativeView addSubview:_nativeView.mediaView];
        _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        [_nativeView addSubview:_iconView];
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 270, self.view.frame.size.width, 15)];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        [_nativeView addSubview:_titleLabel];
        _bodyLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 285, self.view.frame.size.width, 15)];
        _bodyLabel.font = [UIFont systemFontOfSize:13];
        [_nativeView addSubview:_bodyLabel];
    }
    return _nativeView;
}


// NativeAD
-(void)NativeBtnDidClicked
{
    [self.native loadAd];
}



@end
