//
//  KLGuideCustomCell.h
//  KLGuidePage_Example
//
//  Created by Logic on 2020/5/28.
//  Copyright © 2020 Kalanhall@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KLGuideCustomCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *subTitleLabel;
@property (strong, nonatomic) UIButton *entryBtn;

@property (copy  , nonatomic) void (^entryBlock)(void);

@end

NS_ASSUME_NONNULL_END
