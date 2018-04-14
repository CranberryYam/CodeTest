//
//  iOSAppTests.m
//  iOSAppTests
//
//  Created by Honglin Yi on 4/13/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HYCache.h"
#import "HYDirCache.h"
#import "HomeController.h"

@interface iOSAppTests : XCTestCase

@end

@implementation iOSAppTests

- (void)testHYCache {
    [HYCache.sharedObject saveImageToCache:[UIImage imageNamed:@"ThumbNail"] identifier: @"http://placehold.it/150/66b7d2"];

    XCTAssertEqual([HYCache.sharedObject checkImageInCache: @"http://placehold.it/150/66b7d2"], true);
    XCTAssertNotNil([HYCache.sharedObject readImageFromCache:@"http://placehold.it/150/66b7d2"]);
}

- (void)testNSCache {
    UIImage *image = [UIImage imageNamed:@"ThumbNail"];
    NSCache *nscache = [[NSCache alloc] init];
    NSString *urlString = @"http://placehold.it/150/66b7d2";
    
    [nscache setObject:image forKey:urlString];
    XCTAssertNotNil([nscache objectForKey:urlString]);
}

- (void)testDirCache {
    UIImage *image = [UIImage imageNamed:@"ThumbNail"];
    NSString *urlString = @"http://placehold.it/150/66b7d2";
    
    [HYDirCache saveImageToDirectory:image identifier:urlString];
    XCTAssertTrue([HYDirCache checkImageInDirectory:urlString]);
    XCTAssertNotNil([HYDirCache readImageFromDirectory:urlString]);
    [HYDirCache displayFiles];
}

@end
