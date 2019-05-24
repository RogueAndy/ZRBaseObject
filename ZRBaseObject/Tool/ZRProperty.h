//
//  ZRProperty.h
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/3/15.
//  Copyright © 2019 rogue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

NSString *ZRAppBuild(void); // 获取 app build 号

NSString *ZRAppName(void); // 获取 app 的名称

NSString *ZRAppVersion(void); // 获取 app 版本号

UIWindow *ZRKeyWindow(void); // 获取主 window

void ZRSystemSetting(void); // 打开系统设置

BOOL ZRIsRegisterRemote(void); // 获取是否打开推送设置

@interface ZRProperty : NSObject

+ (CGFloat)calculateHeightWithString:(NSString *)string width:(CGFloat)width font:(UIFont *)font; // 计算文本适应的高度

+ (CGFloat)calculateWidthWithString:(NSString *)string height:(CGFloat)height font:(UIFont *)font; // 计算文本适应的宽度

+ (NSString *)getFirstLetterWithString:(NSString *)string; // 获取字符串首字母，如果首字母非字母，则返回"~"

+ (NSString *)getPinyinWithString:(NSString *)string; // 汉字转拼音

+ (UIImage *)getImageInVideo:(NSString *)videoURL; // 获取本地视频连接的第一帧

+ (CGFloat)labelTextCountWidthWithLabelText:(NSString *)labelText; // 根据字符串的长度计算label的宽度

+ (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth; // 适配图片大小宽度

+ (NSString *)getDeviceInfo; // 获取手机设备型号

@end

NS_ASSUME_NONNULL_END
