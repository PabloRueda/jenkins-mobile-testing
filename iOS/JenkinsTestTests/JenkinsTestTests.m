//
//  JenkinsTestTests.m
//  JenkinsTestTests
//
//  Created by Pablo on 17/09/14.
//  Copyright (c) 2014 Pablo Rueda. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface JenkinsTestTests : XCTestCase

@end

@implementation JenkinsTestTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFail {
    XCTFail(@"Fail");
}

- (void)testSuccess {
}

@end
