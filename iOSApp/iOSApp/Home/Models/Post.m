//
//  Post.m
//  iOSApp
//
//  Created by Honglin Yi on 4/13/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

#import "Post.h"

@implementation Post

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        self.albumID = [(NSNumber *)dictionary[@"albumId"] integerValue];
        self.identifier = [(NSNumber *)dictionary[@"id"] integerValue];
        self.title = dictionary[@"title"];
        self.url = [NSURL URLWithString:dictionary[@"url"]];
        self.thumbnailURL = [NSURL URLWithString:dictionary[@"thumbnailUrl"]];
    }
    return self;
}
@end
