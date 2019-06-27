//
//  ZRRemoteNotification.h
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/6/27.
//  Copyright © 2019 rogue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZRRemoteNotification : NSObject

/**
 判断app是否开启远程推送，如果系统推送关闭，则app推送必定关闭，建议在 ViewController 的 viewWillAppear: 方法调用，实时刷新

 @return true = 开启
 */
+ (BOOL)isAllowAppRemoteNotification;

/**
 判断系统推送是否开启

 @return true = 开启
 */
+ (BOOL)isAllowSystemRemoteNotification;

/**
 跳转到系统设置推送页面
 */
+ (void)intoSystemSetting;

/**
 开启推送，如果系统的推送被关闭，则询问是否跳转到系统设置页

 @param viewController 哪一个控制器调用
 @return 开启成功返回 true
 */
+ (BOOL)openRemoteNotification:(UIViewController *)viewController;

/**
 关闭app远程推送，但是不会关闭系统的推送设置

 @return 关闭成功返回 true
 */
+ (BOOL)closeRemoteNotification;

@end

NS_ASSUME_NONNULL_END
