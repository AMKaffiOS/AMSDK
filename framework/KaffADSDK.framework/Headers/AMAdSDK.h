//
//  AMAdSDK.h
//  AMSDK
//
//  Created by zjw1 on 2017/1/6.
//  Copyright © 2017年 AM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMAdSDK : NSObject

+ (instancetype)shareInstance;

- (void)resgistWithAppkey:(NSString *)appkey;

@property(nonatomic, copy, readonly) NSString *appKey;

@property (nonatomic, assign) BOOL debugEable;

@end
