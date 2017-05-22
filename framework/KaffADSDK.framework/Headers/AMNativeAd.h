//
//  AMNativeAd.h
//  AMSDK
//
//  Created by zjw1 on 2017/1/6.
//  Copyright © 2017年 AM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMNativeAd : NSObject


- (instancetype)initWithDict:(NSDictionary *)dict;

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

@end
