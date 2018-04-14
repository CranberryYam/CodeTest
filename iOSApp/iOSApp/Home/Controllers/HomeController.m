//
//  HomeController.m
//  iOSApp
//
//  Created by Honglin Yi on 4/13/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

#import "HomeController.h"
#import "PhotoController.h"
#import "FeedClient.h"
#import "Post.h"
#import "PostCell.h"
#import "HYCache.h"
#import "HYPhotoBrowserAnimator.h"

static NSString *const postCellID = @"PostCell";
static CGFloat const postCellHeight = (CGFloat)70.0;

@interface HomeController () <photoBrowserAnimatorPresentDelegate>
@property (nonatomic, strong) FeedClient *client;
@property (nonatomic, strong) NSMutableArray *posts;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *cellNib = [UINib nibWithNibName:postCellID bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:postCellID];
    self.client = [[FeedClient alloc]init];
    [self readPosts];
}

- (void)readPosts {
    [self.client fetchFeedData:^(NSArray<Post *> *posts){
        if(posts){
            self.posts = [NSMutableArray arrayWithArray:posts];
        }
    } withError:^(NSString *error){
        if (error) {
            NSLog(@"Error: %@",error);
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return postCellHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:postCellID forIndexPath:indexPath];
    Post *post = self.posts[indexPath.row];
    cell.tapBlock = ^(void) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Photo" bundle:nil];
        PhotoController *pc = [storyboard instantiateViewControllerWithIdentifier:@"Photo"];
        pc.imageUrl = post.url;
        [self presentViewController:pc animated:true completion:nil];
    };
    [cell addDatasPicUrl:post.thumbnailURL title:post.title];
    return cell;
}

@end
