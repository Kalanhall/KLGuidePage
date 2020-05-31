//
//  KLAppDelegate.m
//  KLGuidePage
//
//  Created by Kalanhall@163.com on 05/28/2020.
//  Copyright (c) 2020 Kalanhall@163.com. All rights reserved.
//

#import "KLAppDelegate.h"
#import "KLGuideCustomCell.h"
@import KLGuidePage;
@import Lottie;
@import Masonry;

@interface KLAppDelegate () <KLGuidePageDataSource, KLGuidePageDelegate>

@property (strong, nonatomic) NSArray *datas;
@property (strong, nonatomic) LOTAnimationView *lottieView;

@end

@implementation KLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [self.window makeKeyAndVisible];
    
    self.datas = @[[UIImage imageNamed:@"1"], [UIImage imageNamed:@"2"], [UIImage imageNamed:@"3"]];
    KLGuidePage *page = [KLGuidePage pageWithStyle:KLGuideStyleTranslationFade dataSource:self];
    page.hideForLastPage = YES;
    page.alphaMultiple = 1.5;
    page.duration = 1;
    page.bottomControl.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    page.bottomControl.contentInset = UIEdgeInsetsMake(0, 0, 0, 30);
    [page registerClass:KLGuideCustomCell.class forCellWithReuseIdentifier:KLGuideCustomCell.description];
    
    return YES;
}

- (NSArray *)dataOfItems {
    return self.datas;
}

- (UICollectionViewCell *)guidePage:(KLGuidePage *)page data:(id)data cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    KLGuideCustomCell *cell = (KLGuideCustomCell *)[page dequeueReusableCellWithReuseIdentifier:KLGuideCustomCell.description forIndexPath:indexPath];
    cell.imageView.image = data;
    cell.titleLabel.text = @[@"欢迎使用京东", @"请授权位置信息权限", @"获取最新的促销信息"][indexPath.row];
    cell.subTitleLabel.text = @[@"正品低价、急速配送\n点缀您的品质生活", @"获取周边库存信息和周边服务、推送专属\n商品与优惠", @"随时了解促销信息，掌握实时物流动态\n请\"允许\"京东获取消息通知权限"][indexPath.row];
    cell.entryBtn.hidden = indexPath.row != self.datas.count - 1;
    
    // 立即体验-p0
    __weak typeof(page) weakpage = page;
    cell.entryBlock = ^{
        [weakpage hideWithStyle:KLGuideHideStyleMoveLeft animated:YES];
    };

    return cell;
}

/**
 KLGuideStyleFade
 需要单独实现这个装载图片的视图
 */
- (UIView *)guidePage:(KLGuidePage *)page data:(id)data viewForItemAtIndexPath:(NSIndexPath *)indexPath {
    UIImageView *imageView = UIImageView.alloc.init;
    imageView.image = data;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    return imageView;
}

@end
