//
//  KLGuideCustomCell.m
//  KLGuidePage_Example
//
//  Created by Logic on 2020/5/28.
//  Copyright © 2020 Kalanhall@163.com. All rights reserved.
//

#import "KLGuideCustomCell.h"
@import Masonry;

@implementation KLGuideCustomCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = UIImageView.alloc.init;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        
        self.titleLabel = UILabel.new;
        self.titleLabel.textColor = UIColor.blackColor;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:25];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.centerY.mas_equalTo(self.contentView.mas_centerY).multipliedBy(1.3);
        }];
        
        self.subTitleLabel = UILabel.new;
        self.subTitleLabel.textColor = [UIColor.blackColor colorWithAlphaComponent:0.6];
        self.subTitleLabel.font = [UIFont systemFontOfSize:16];
        self.subTitleLabel.numberOfLines = 0;
        self.subTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.subTitleLabel];
        [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(15);
        }];
        
        self.entryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.entryBtn.backgroundColor = UIColor.redColor;
        self.entryBtn.layer.cornerRadius = 9;
        self.entryBtn.clipsToBounds = YES;
        [self.entryBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [self.entryBtn setTitle:@"立即体验" forState:UIControlStateNormal];
        [self.contentView addSubview:self.entryBtn];
        [self.entryBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(50);
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(-50);
        }];
        
        [self.entryBtn addTarget:self action:@selector(entryBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)entryBtnClick:(UIButton *)sender {
    if (self.entryBlock) {
        self.entryBlock();
    }
}

@end
