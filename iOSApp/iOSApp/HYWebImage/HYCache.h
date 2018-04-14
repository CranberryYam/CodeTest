//
//  HYCache.h
//  iOSApp
//
//  Created by Honglin Yi on 4/13/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYCache : NSObject
+ (instancetype)sharedObject;

- (BOOL) checkImageInCache: (NSString *)identifier;
- (void) saveImageToCache: (UIImage *)image identifier:(NSString *)identifier;
- (UIImage *) readImageFromCache: (NSString *)identifier;

@end
