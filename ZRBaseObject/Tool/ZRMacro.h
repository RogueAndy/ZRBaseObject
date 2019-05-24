//
//  ZRMacro.h
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/1/10.
//  Copyright © 2019 rogue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define ZR_ios_system ([[[UIDevice currentDevice] systemVersion] floatValue])

// iPhone X、XR、XS、XS Max 判断
#define ZRIPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

// 导航栏高度
#define ZRSafeAreaTopHeight (ZRIPHONE_X ? 88 : 64)

// 标签栏高度
#define ZRSafeAreaBottomHeight (ZRIPHONE_X ? (49 + 34) : 49)

// 定义导航栏开始布局的高度，纵坐标的 Y，非 IphoneX 是基于 20 状态栏 的高度布局，而IphoneX是基于 44 的高度开始布局
#define ZRSafeAreaNaviTopY (ZRIPHONE_X ? 44 : 20)
#define ZRSafeAreaTabBottomY (ZRIPHONE_X ? 34 : 0)
#define ZRSafeAreaBottomY (ZRIPHONE_X ? 17 : 0)

// 判断字符串是否为空
#define ZR_StringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] < 1 ? YES : NO )
// 防止String返回值为空为导致Crash
#define ZR_string(str) ({NSString *value = @"";\
value = str ? str : @"";\
(value);})

#define ZR_ScreenBound [[UIScreen mainScreen] bounds]
#define ZR_ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ZR_ScreenHeight [[UIScreen mainScreen] bounds].size.height

// 屏幕比例适配，以 375px为基
#define ZR_matching_scale (ZR_ScreenWidth / 375.0)

// 宽度比例适配
#define ZR_matching_width(width) ((width) * ZR_matching_scale)

// 字体大小适配
#define ZR_font(size) [UIFont systemFontOfSize:size]
#define ZR_fontWeight(size, weight) [UIFont systemFontOfSize:size weight:weight]
#define ZR_match_font(size) [UIFont systemFontOfSize:ZR_matching_width(size)]
#define ZR_match_fontWeight(size, weight) [UIFont systemFontOfSize:ZR_matching_width(size) weight:ZR_matching_width(weight)]

#define ZR_imageFromBundle(bundleName, imageName) [[[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"] stringByAppendingPathComponent:imageName]

@interface ZRMacro : NSObject

+ (UIWindow *)getKeyWindow;

@end

NS_ASSUME_NONNULL_END
