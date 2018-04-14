//
//  FeedClient.m
//  iOSApp
//
//  Created by Honglin Yi on 4/13/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

#import "FeedClient.h"

@interface FeedClient ()
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation FeedClient


- (void)fetchFeedData:(void (^)(NSArray<Post *> *))completion withError:(void (^)(NSString *error))errorBlock
{
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"https://jsonplaceholder.typicode.com/photos"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];

    if(json){
        NSArray *datas = [json copy];
        NSMutableArray *Posts = [[NSMutableArray alloc]init];
        for (NSDictionary *data in datas) {
            Post *post = [[Post alloc] initWithDictionary:data];
            [Posts addObject:post];
        }
        completion([Posts copy]);
    }else{
        errorBlock(error.localizedDescription);
    }

}

@end
