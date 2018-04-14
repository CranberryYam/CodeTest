//
//  Post.h
//  iOSApp
//
//  Created by Honglin Yi on 4/13/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property (nonatomic) NSInteger albumID;
@property (nonatomic) NSInteger identifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSURL *thumbnailURL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
