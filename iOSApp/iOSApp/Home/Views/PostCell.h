//
//  PostCell.h
//  iOSApp
//
//  Created by Honglin Yi on 4/13/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostCell : UITableViewCell
@property (nonatomic, copy, nullable) void (^tapBlock)(void);
- (void)addDatasPicUrl:(nonnull NSURL *)picUrl title:(nonnull NSString *)title;
@end
