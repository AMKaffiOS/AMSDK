//
//  AMNativeAdDelegate.h
//  AMSDK
//
//  Created by zjw1 on 2017/1/7.
//  Copyright © 2017年 AM. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AMError;
@class AMNativeAd;
@class AMNativeAdService;

@protocol AMNativeAdDelegate <NSObject>

@optional

/**
 广告调用成功

 @param nativeAdService 广告服务对象
 @param nativeAds 广告对象列表
 @param placementId 广告placementId
 */
- (void)nativeAdService:(AMNativeAdService *)nativeAdService
           didLoadedAds:(NSArray<AMNativeAd *> *)nativeAds
        withPlacementId:(NSString *)placementId;


/**
 广告调用失败

 @param nativeAdService 广告服务对象
 @param error 错误信息
 @param placementId 广告placementId
 */
- (void)nativeAdService:(AMNativeAdService *)nativeAdService
             loadFailed:(AMError *)error
        withPlacementId:(NSString *)placementId;


/**
 广告展示

 @param nativeAdService 广告服务对象
 @param ad 展示的广告
 @param placementId 广告placementId
 */
- (void)nativeAdService:(AMNativeAdService *)nativeAdService
                didShow:(AMNativeAd *)ad
        withPlacementId:(NSString *)placementId;


/**
 广告点击

 @param nativeAdService nativeAdService 广告服务对象
 @param ad 点击的广告
 @param placementId 广告placementId
 */
- (void)nativeAdService:(AMNativeAdService *)nativeAdService
               didClick:(AMNativeAd *)ad
        withPlacementId:(NSString *)placementId;

@end
