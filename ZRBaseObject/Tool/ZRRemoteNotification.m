//
//  ZRRemoteNotification.m
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/6/27.
//  Copyright © 2019 rogue. All rights reserved.
//

#import "ZRRemoteNotification.h"
#import <UIKit/UIKit.h>

@implementation ZRRemoteNotification

+ (BOOL)isAllowRemoteNotification {
    BOOL isEnable = NO;
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
    isEnable = (UIUserNotificationTypeNone == setting.types) ? NO : YES;
    return isEnable;
}

+ (void)intoSystemSetting {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([application canOpenURL:url]) {
        if (@available(iOS 10.0, *)) {
            [application openURL:url options:@{} completionHandler:nil];
        } else {
            NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"prefs:root=%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]]];
            [application openURL:url];
        }
    }
}

@end
