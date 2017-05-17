//
//  AMNativeAd.h
//  AMSDK
//
//  Created by zjw1 on 2017/1/6.
//  Copyright © 2017年 AM. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FBNativeAd;

typedef NS_ENUM(NSInteger, AMAdType) {
    AMAltaAD = 0,
    AMFBAD,
};

@interface AMNativeAd : NSObject

/**
 * placementId
 */
@property (nonatomic, strong) NSString *placementId;


/**
 * 广告appid
 */
@property (nonatomic, strong) NSString *appInfoId;


/**
 * app名称
 */
@property (nonatomic, strong) NSString *titile;

/**
 icon图片地址
 */
@property (nonatomic, strong) NSString *iconUrl;


/**
 * cover图片地址
 */
@property (nonatomic, strong) NSString *coverUrl;


/**
 * APP描述信息
 */
@property (nonatomic, strong) NSString *desc;


/**
 * APP分类信息
 */
@property (nonatomic, strong) NSString *category;


/**
 * APP包名
 */
@property (nonatomic, strong) NSString *packageName;

/**
 广告类型
 */
@property (nonatomic, assign) AMAdType amAdType;


- (instancetype)initWithDict:(NSDictionary *)dict;
- (instancetype)initWithFBNativeAd:(FBNativeAd *)fbNativeAd;

@end
