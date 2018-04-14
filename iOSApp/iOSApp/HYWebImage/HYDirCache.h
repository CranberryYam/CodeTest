//
//  HYDirCache.h
//  iOSApp
//
//  Created by Honglin Yi on 4/14/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HYDirCache : NSObject
+ (BOOL) checkImageInDirectory: (NSString *)identifier;
+ (void) saveImageToDirectory:(UIImage *)image identifier:(NSString *)identifier;
+ (UIImage *) readImageFromDirectory: (NSString *)identifier;

+ (void) displayFiles;
@end
