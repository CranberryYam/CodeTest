//
//  UIImageView+HYWebImage.h
//  iOSApp
//
//  Created by Honglin Yi on 4/13/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (HYWebImage)
- (void) setImageWithUrl: (nonnull NSURL *) url placeholderImage:(nullable UIImage *)placeholder;
@end
