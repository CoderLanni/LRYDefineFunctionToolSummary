//
//  VC_____View___View________BlockTests.m
//  VC 中添加 View 在 View 中使用按钮的 BlockTests
//
//  Created by ZE KANG on 2017/5/16.
//  Copyright © 2017年 LRY. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface VC_____View___View________BlockTests : XCTestCase

@end

@implementation VC_____View___View________BlockTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
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
