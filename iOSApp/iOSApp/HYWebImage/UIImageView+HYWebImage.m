//
//  UIImageView+HYWebImage.m
//  iOSApp
//
//  Created by Honglin Yi on 4/13/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

#import "UIImageView+HYWebImage.h"
#import "HYCache.h"

@implementation UIImageView (HYWebImage)
- (void) setImageWithUrl: (NSURL*) url
         placeholderImage:(nullable UIImage *)placeholder {
    self.image = placeholder;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{

        if ([HYCache.sharedObject checkImageInCache:url.absoluteString]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage *image = [HYCache.sharedObject readImageFromCache:url.absoluteString];
                if (image) {
                    self.image = image;
                }
            });
        }else {
            NSData * imageData = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:imageData];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (image) {
                    self.image = image;
                    [HYCache.sharedObject saveImageToCache:image identifier:url.absoluteString];
                }
            });
        }
    });
}


@end
