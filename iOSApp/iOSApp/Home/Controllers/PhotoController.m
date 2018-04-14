//
//  PhotoController.m
//  iOSApp
//
//  Created by Honglin Yi on 4/14/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

#import "PhotoController.h"
#import "UIImageView+HYWebImage.h"

@interface PhotoController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@end

@implementation PhotoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.imageV setImageWithUrl:self.imageUrl placeholderImage:[UIImage imageNamed:@"ThumbNail.png"]];
    [self setupBackBtn];
}

- (void) setupBackBtn {
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)backAction:(UITapGestureRecognizer *)tap {
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
