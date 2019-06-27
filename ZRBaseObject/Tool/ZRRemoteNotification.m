//
//  ZRRemoteNotification.m
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/6/27.
//  Copyright © 2019 rogue. All rights reserved.
//

#import "ZRRemoteNotification.h"
#import "UIAlertController+ZRAlert.h"

// 在系统UserDefaults 里面注册一个app推送是否开启的开关判断 ZRRemoteNotification_Open_App = 1 时候为开启，其余状态都是关闭app推送
#define ZRRemoteNotification_Open_App @"ZRRemoteNotification_Open_App"

@implementation ZRRemoteNotification

+ (BOOL)isAllowAppRemoteNotification {
    BOOL isEnble = [self isAllowSystemRemoteNotification];
    if(isEnble) {
        isEnble = false;
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *open = [userDefaults objectForKey:ZRRemoteNotification_Open_App];
        if([open isEqualToString:@"1"]) {
            isEnble = true;
        }
    }
    return isEnble;
}

+ (BOOL)isAllowSystemRemoteNotification {
    BOOL isEnable = NO;
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
    isEnable = (UIUserNotificationTypeNone == setting.types) ? NO : YES;
    return isEnable;
}

+ (void)intoSystemSetting {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if (@available(iOS 10.0, *)) {
        if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
            [application openURL:url options:@{} completionHandler:nil];
        }
    } else {
        if([application canOpenURL:url]) {
            [application openURL:url];
        }
    }
}

+ (BOOL)openRemoteNotification:(UIViewController *)viewController {
    if([self isAllowSystemRemoteNotification]) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:@"1" forKey:ZRRemoteNotification_Open_App];
        [userDefaults synchronize];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        return true;
    }
    
    UIAlertController *alert = [UIAlertController alertWithTitle:@"是否需要到设置页开启推送" message:@"" sureTitle:@"是的" cancelTitle:@"取消" sureHandler:^(UIAlertAction * _Nonnull action) {
        [ZRRemoteNotification intoSystemSetting];
    } cancelHandler:nil];
    [viewController presentViewController:alert animated:true completion:nil];
    return false;
}

+ (BOOL)closeRemoteNotification {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"0" forKey:ZRRemoteNotification_Open_App];
    [userDefaults synchronize];
    [[UIApplication sharedApplication] unregisterForRemoteNotifications];
    return true;
}

@end
