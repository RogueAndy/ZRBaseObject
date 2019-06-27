//
//  ZRRemoteNotification.h
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/6/27.
//  Copyright © 2019 rogue. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZRRemoteNotification : NSObject

+ (BOOL)isAllowRemoteNotification;

+ (void)intoSystemSetting;

@end

NS_ASSUME_NONNULL_END
