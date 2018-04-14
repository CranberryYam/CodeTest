//
//  FeedClient.h
//  iOSApp
//
//  Created by Honglin Yi on 4/13/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Post.h"

@interface FeedClient : NSObject
- (void)fetchFeedData:(void (^)(NSArray<Post *> *))completion withError:(void (^)(NSString *error))errorBlock;
@end
