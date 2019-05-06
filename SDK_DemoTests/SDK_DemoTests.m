//
//  SDK_DemoTests.m
//  SDK_DemoTests
//
//  Created by M on 2019/2/28.
//  Copyright © 2019 Stone. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OneViewController.h"
#import "AdTimingAds.h"
#import <AdTiming/ADTNativeAd.h>


@interface SDK_DemoTests : XCTestCase

//@property (nonatomic, strong) ADTNativeAd *nativeAd;
//@property (nonatomic, strong)ADTNative *native;
//@property(nonatomic,strong)ADTNativeView *nativeView;

@end

@implementation SDK_DemoTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    NSLog(@"开始测试!");
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    NSLog(@"结束测试!");
}

-(void)testFunc
{
    // 实例化测试对象
    // 测试哪个类型里的方法就要引入那个类
    OneViewController *vc = [[OneViewController alloc] init];
    
    // 调用测试方法获取测试结果
    [vc testvvv];
    
    
    
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
