//
//  KOMContainerTests.m
//  KOMContainerTests
//
//  Created by KohkiMakimoto on 10/17/14.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "KOMContainer.h"

@interface KOMContainerTests : XCTestCase

@end

@implementation KOMContainerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBind {
    // This is an example of a functional test case.
//    XCTAssert(YES, @"Pass");
    
    
    KOMContainer *container = [KOMContainer sharedContainer];
    [container bindKey:@"test.arr" resolver:^id(KOMContainer *container){
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        
        [arr addObject:@"hogehoge"];
        [arr addObject:@"foofoo"];
        
        return arr;
    }];
    
    NSMutableArray *resolvedInstance = (NSMutableArray *)[container objectForKey:@"test.arr"];
    XCTAssertEqual(@"hogehoge", [resolvedInstance objectAtIndex:0]);
    XCTAssertEqual(@"foofoo", [resolvedInstance objectAtIndex:1]);

    // check shared object
    NSMutableArray *resolvedInstance2 = (NSMutableArray *)[container objectForKey:@"test.arr"];
    [resolvedInstance2 addObject:@"barbar"];
    XCTAssertEqual(3, resolvedInstance.count);
}

- (void)testBindNotShared {

    KOMContainer *container = [KOMContainer sharedContainer];
    [container bindKey:@"test.arr2" shared:NO resolver:^id(KOMContainer *container){
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        
        [arr addObject:@"hogehoge"];
        [arr addObject:@"foofoo"];
        
        return arr;
    }];
    
    NSMutableArray *resolvedInstance = (NSMutableArray *)[container objectForKey:@"test.arr2"];
    XCTAssertEqual(@"hogehoge", [resolvedInstance objectAtIndex:0]);
    XCTAssertEqual(@"foofoo", [resolvedInstance objectAtIndex:1]);
    
    // check no shared object
    NSMutableArray *resolvedInstance2 = (NSMutableArray *)[container objectForKey:@"test.arr"];
    [resolvedInstance2 addObject:@"barbar"];
    XCTAssertEqual(2, resolvedInstance.count);
}

- (void)testBindInstance {
    
    KOMContainer *container = [KOMContainer sharedContainer];
    [container bindKey:@"test.obj" object:@"hogehogehoge"];
    
    NSString *str = (NSString *)[container objectForKey:@"test.obj"];
    XCTAssertEqual(@"hogehogehoge", str);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
