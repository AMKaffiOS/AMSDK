//
//  AMNativeAdService.h
//  AMSDK
//
//  Created by zjw1 on 2017/1/6.
//  Copyright © 2017年 AM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMNativeAdDelegate.h"
#import <UIKit/UIKit.h>

@class AMNativeAd;

@interface AMNativeAdService : NSObject

@property (nonatomic, weak) id<AMNativeAdDelegate> delegate;

+ (instancetype)defaultService;

- (void)loadAdsWithPlacementId:(NSString *)placementId count:(NSInteger)count;

- (void)registerViewForInteraction:(AMNativeAd *)nativeAd
                withClickableViews:(NSArray<UIView *> *)clickableViews;

- (void)registerViewForInteraction:(AMNativeAd *)nativeAd
                withClickableViews:(NSArray<UIView *> *)clickableViews
                         currentVC:(UIViewController *)currentVC;

/**
 * SDK 生成mediaview choiceview
 */
- (UIView *)fbChoiceViewWithNativeAd:(AMNativeAd *)nativeAd;
- (UIView *)fbMediaViewWithNativeAd:(AMNativeAd *)nativeAd;

@end
