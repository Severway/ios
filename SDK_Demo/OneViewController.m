//
//  OneViewController.m
//  SDK_Demo
//
//  Created by M on 2019/2/28.
//  Copyright © 2019 Stone. All rights reserved.
//

#import "OneViewController.h"
#import <AdTiming/AdTiming.h>

@interface OneViewController ()<ADTVideoAdDelegate,ADTInterstitialDelegate,ADTNativeDelegate,ADTBannerDelegate,ADTInteractiveDelegate>
{
    ADTInteractive *_interactive;
}
@property(nonatomic,strong)UIButton *VideoBtn;
@property(nonatomic,strong)UIButton *InterstitialBtn;
@property(nonatomic,strong)UIButton *NativeBtn;
@property(nonatomic,strong)UIButton *InteractiveBtn;
@property(nonatomic,strong)UIButton *BannerBtn;

@property(nonatomic,strong)ADTInterstitial *interstitial;

@property (nonatomic, strong) ADTNativeAd *nativeAd;
@property (nonatomic, strong)ADTNative *native;
@property(nonatomic,strong)ADTNativeView *nativeView;
@property(nonatomic,strong)UIImageView *iconView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *bodyLabel;

@property(nonatomic,strong)ADTBanner *banner;


@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"One";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // VideoAd
    _VideoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _VideoBtn.frame = CGRectMake(35, 20+64, 100, 50);
    [_VideoBtn setTitle:@"VideoAd" forState:UIControlStateNormal];
    [_VideoBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    _VideoBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _VideoBtn.backgroundColor = [UIColor whiteColor];
    _VideoBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    _VideoBtn.layer.cornerRadius = 5;
    [_VideoBtn addTarget:self action:@selector(VideoBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_VideoBtn];
    
    
    // InterstitialAd
    _InterstitialBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _InterstitialBtn.frame = CGRectMake(35, 20+64+50, 200, 50);
    [_InterstitialBtn setTitle:@"抽奖" forState:UIControlStateNormal];
    [_InterstitialBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    _InterstitialBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _InterstitialBtn.backgroundColor = [UIColor whiteColor];
    _InterstitialBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    _InterstitialBtn.layer.cornerRadius = 5;
    [_InterstitialBtn addTarget:self action:@selector(InterstitialBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_InterstitialBtn];
    
    self.native = [[ADTNative alloc]initWithPlacmentID:@"3551"];
    self.native.delegate = self;
    [self.view addSubview:self.nativeView];
    
    // NativeBtn
    _NativeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _NativeBtn.frame = CGRectMake(35, 20+64+50+50, 100, 50);
    [_NativeBtn setTitle:@"NativeAd" forState:UIControlStateNormal];
    [_NativeBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    _NativeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _NativeBtn.backgroundColor = [UIColor whiteColor];
    _NativeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    _NativeBtn.layer.cornerRadius = 5;
    [_NativeBtn addTarget:self action:@selector(NativeBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_NativeBtn];
    
    // BannerBtn
    _BannerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _BannerBtn.frame = CGRectMake(35, 20+64+50+50+50, 100, 50);
    [_BannerBtn setTitle:@"BannerAd" forState:UIControlStateNormal];
    [_BannerBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    _BannerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _BannerBtn.backgroundColor = [UIColor whiteColor];
    _BannerBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    _BannerBtn.layer.cornerRadius = 5;
    [_BannerBtn addTarget:self action:@selector(BannerBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_BannerBtn];
    
    _interactive = [[ADTInteractive alloc] initWithPlacementID:@"4033"];
    _interactive.delegate = self;
    
}

// VideoAd
-(void)VideoBtnDidClicked
{
    [ADTVideoAd sharedInstance].delegate = self;
    [[ADTVideoAd sharedInstance] loadWithPlacmentID:@"3511"];
//    [[ADTVideoAd sharedInstance] isReady:@"3211"];
}

// Video的代理方法
- (void)ADTVideoAdDidload:(NSString*)placementID{
    NSLog(@"videoAdDidLoad");

    [[ADTVideoAd sharedInstance] show:@"3511"];
}
- (void)ADTVideoAdDidFailToLoad:(NSString*)placementID error:(NSError*)error{
    NSLog(@"videoAd didFail");
    
}
- (void)ADTVideoAdDidStart:(NSString*)placementID{
    NSLog(@"VideoAdStartPlay");
}
- (void)ADTVideoAdDidClick:(NSString*)placementID{
    NSLog(@"videoAdDidClick");
}
- (void)ADTVideoAdDidClose:(NSString*)placementID finishState:(ADTVideoAdFinishState)state{
    
   [[ADTVideoAd sharedInstance] show:@"3511"];
    
    if(state == ADTVideoAdFinishStateSkipped){
        NSLog(@"VideoAdFinishPlay(skip)");
    } else if (state == ADTVideoAdFinishStateCompleted){
        NSLog(@"VideoAdFinishPlay(complete)");
    }
}



// 互动
-(void)InterstitialBtnDidClicked
{
    
    [_interactive load];
    
    
}


- (void)ADTInteractiveDidLoad:(ADTInteractive*)interactive {
    NSLog(@"interactiveAdDidLoad");
    [_interactive show];
}
- (void)ADTInteractive:(ADTInteractive*)interactive didFailWithError:(NSError*)error {
    NSLog(@"interactiveAd didFail");
}
- (void)ADTInteractiveWillWillExposure:(ADTInteractive*)interactive {
    NSLog(@"interactiveAdWillExposure");
}
- (void)ADTInteractiveDidClose:(ADTInteractive*)interactive {
    NSLog(@"interactiveAdDidClose");
    [_interactive show];
}

// 插屏初始化
- (ADTInterstitial*)interstitial{
    if(!_interstitial){
        _interstitial = [[ADTInterstitial alloc] initWithPlacementID:@"3552"];
        _interstitial.delegate = self;
    }
    return _interstitial;
}

// 插屏代理方法
- (void)ADTInterstitialDidLoad:(ADTInterstitial *)interstitial {
    NSLog(@"interstitialAdDidLoad");

    [self.interstitial showWithRootViewController:self];
    
}
- (void)ADTInterstitial:(ADTInterstitial *)interstitial didFailWithError:(NSError *)error {
    NSLog(@"interstitialAd didFail");
}
- (void)ADTInterstitialDidClick:(ADTInterstitial *)interstitial {
    NSLog(@"interstitialAdDidClick");
    
}
- (void)ADTInterstitialDidClose:(ADTInterstitial *)interstitial {
    NSLog(@"interstitialAdDidClose");
    
//    [self.interstitial showWithRootViewController:self];
    
}
- (void)ADTInterstitialWillExposure:(ADTInterstitial *)interstitial {
    NSLog(@"interstitialAdWillExposure");
}


// NativeAd
-(void)NativeBtnDidClicked
{
    
    [self.native loadAd];
}

// Native初始化
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

// Native代理方法
- (void)ADTNative:(ADTNative*)native didLoad:(ADTNativeAd*)nativeAd{
    NSLog(@"nativeAdDidLoad");
    
    self.nativeView.hidden = NO;
    self.nativeView.nativeAd = self.nativeAd;
    _iconView.image =[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.nativeAd.iconUrl]]];
    //    _titleLabel.text = self.nativeAd.title;
    _bodyLabel.text = self.nativeAd.body;
    
}
- (void)ADTNative:(ADTNative*)native didFailWithError:(NSError*)error{
    NSLog(@"nativeAd didFail");
}
- (void)ADTNativeWillExposure:(ADTNative*)native{
    NSLog(@"nativeAdWillExposure");
}
- (void)ADTNativeDidClick:(ADTNative*)native{
    NSLog(@"nativeAdDidClick");
}

// BannerAd
-(void)BannerBtnDidClicked
{
    [self.banner loadAndShow];
}

// BannerAd
- (ADTBanner*)banner{
    if(!_banner){
        _banner = [[ADTBanner alloc] initWithBannerType:ADTBannerTypeDefault placementID:@"3550"];
        [_banner addLayoutAttribute:ADTBannerLayoutAttributeHorizontally constant:0];
        [_banner addLayoutAttribute:ADTBannerLayoutAttributeVertically constant:0];
        _banner.delegate = self;
        [self.view addSubview:_banner];
    }
    return _banner;
}


// BannerAd代理方法
- (void)ADTBannerDidLoad:(ADTBanner *)banner {
    NSLog(@"bannerAdDidLoad");
    
    //    [self.banner loadAndShow];
}
- (void)ADTBanner:(ADTBanner *)banner didFailWithError:(NSError *)error {
    NSLog(@"bannerAd didFail");
    
    //    [self.banner loadAndShow];
    
}
- (void)ADTBannerWillExposure:(ADTBanner *)banner {
    NSLog(@"bannerAdWillExposure");
}
- (void)ADTBannerDidClick:(ADTBanner *)banner {
    NSLog(@"bannerAdDidClick");
}

@end
