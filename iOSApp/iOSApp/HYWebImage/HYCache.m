//
//  HYCache.m
//  iOSApp
//
//  Created by Honglin Yi on 4/13/18.
//  Copyright © 2018 henryyi. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "HYCache.h"
#import "HYDirCache.h"

@interface HYCache()
@property (nonatomic, strong) NSCache *nscache;
@end

@implementation HYCache

+ (instancetype)sharedObject {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nscache = [[NSCache alloc] init];
    }
    return self;
}

- (BOOL) checkImageInCache: (NSString *)identifier {
    
    BOOL isInDir = [HYDirCache checkImageInDirectory:identifier];
//    NSLog(@"%@",isInDir ? @"TRUE":@"FALSE");
    
    BOOL isInCache = false;
    UIImage *image = [self.nscache objectForKey:identifier];
    if (image) {
        isInCache = true;
    }
//    NSLog(@"%@",isInCache ? @"TRUE":@"FALSE");
    return isInDir || isInCache;
}

- (void) saveImageToCache: (UIImage *)image identifier:(NSString *)identifier {
    [self.nscache setObject:image forKey:identifier];
    [HYDirCache saveImageToDirectory:image identifier:identifier];
}
- (UIImage *) readImageFromCache: (NSString *)identifier {
    if ([self.nscache objectForKey:identifier]) {
        return [self.nscache objectForKey:identifier];
    }
    return [HYDirCache readImageFromDirectory:identifier];
}
@end
