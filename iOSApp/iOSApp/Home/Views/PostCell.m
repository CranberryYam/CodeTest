//
//  PostCell.m
//  iOSApp
//
//  Created by Honglin Yi on 4/13/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

#import "PostCell.h"
#import "UIImageView+HYWebImage.h"

@interface PostCell()
@property (weak, nonatomic) IBOutlet UIImageView *picIV;
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@end

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setupTapGesture];
}
- (void)addDatasPicUrl:(NSURL *)picUrl title:(NSString *)title {
    self.titleL.text = title;
    [self.picIV setImageWithUrl:picUrl placeholderImage:[UIImage imageNamed:@"ThumbNail.png"]];
}

#pragma mark - picView tap gesture

- (void) setupTapGesture {
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tapRecognizer.numberOfTapsRequired = 1;
    self.picIV.userInteractionEnabled = true;
    [self.picIV addGestureRecognizer:tapRecognizer];
}
- (void)tapAction:(UITapGestureRecognizer *)tap {
    if (self.tapBlock) {
        self.tapBlock();
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
