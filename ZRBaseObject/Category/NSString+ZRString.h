//
//  NSString+ZRString.h
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/3/18.
//  Copyright © 2019 rogue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZRString)

#pragma mark - 加密
/**
 *  md5加密
 *
 *  @return 加密后的string
 */
- (NSString *)md5;

/**
 *  sha1加密
 *
 *  @return 加密后的string
 */
- (NSString *)sha1;

#pragma mark - 编码
/**
 *  将文本转换为base64编码
 *
 *  @return base64格式的NSString
 */
- (NSString *)base64EncodedString;

/**
 *  将Base64编码还原
 *
 *  @return 文本NSString
 */
- (NSString *)base64DecodedString;
/**
 utf8编码，已经编码过的不在编码
 
 @return utf8编码的字符串
 */
- (NSString *)stringToUTF8StringEncoding;
#pragma mark - json转换
/**
 json字符串转换成OC的数据结构
 
 @return OC的数据结构(包括NSDictionary、NSArray)
 */
- (id)jsonToObejct;

/**
 json字符串转字典
 
 @return 字典
 */
- (NSDictionary *)jsonToDictionary;

/**
 json字符串转数组
 
 @return 数组
 */
- (NSArray *)jsonToArray;

#pragma mark - 转换
/**
 *  汉字转拼音
 *
 *  @return 拼音
 */
- (NSString *)getPinyin;

/**
 *  获取字符串首字母，如果首字母非字母，则返回"~"
 *
 *  @return 首字母
 */
- (NSString *)getFirstLetter;

#pragma mark - 截取字段
/**
 截取2者之间的字符串
 
 @param startStr 开始字段
 @param endStr 结束字段
 @return 返回中间字段
 */
- (NSString *)getStrBetweenStartStr:(NSString *)startStr andEndStr:(NSString *)endStr;

/**
 截取某个字段之前的数据
 
 @param str 需要截取字段的分解符
 @return 返回截取字段
 */
- (NSString *)getBeforoStrByStr:(NSString *)str;

/**
 截取某个字段之前的数据
 
 @param str 需要截取字段的分解符
 @return 返回截取字段
 */
- (NSString *)getAfterStrByStr:(NSString *)str;
#pragma mark - 判断合法性
///**
// *  判断链接是否包含在白名单里面
// *
// *  @return bool的判断结果
// */
//- (BOOL)isIncludedInWhiteList;

/**
 字符串是为空（包括全空格）
 
 @return bool的判断结果
 */
- (BOOL)isEmpty;

/**
 *  判断手机号
 *
 *  @return 是否合法
 */
- (BOOL)validateMobile;

/**
 *  判断邮箱
 *
 *  @return 是否合法
 */
- (BOOL)validateEmail;

/**
 *  验证身份证号码是否正确的方法
 *
 *  @return 返回YES或NO表示该身份证号码是否符合国家标准
 */
- (BOOL)validateCardNO;

///**
// 获取可用的UrlSting
// 
// @return UrlSting
// */
//- (NSString *)availableUrlString;

#pragma mark - 计算字符串宽度、高度
/**
 *  计算文字占用宽度
 *
 *  @param height 固定高度
 *  @param font   文字大小
 *
 *  @return 宽度
 */
- (CGFloat)calculateWidthWithHeight:(CGFloat)height
                               font:(UIFont *)font;

/**
 *  计算文字占用高度
 *
 *  @param width  固定宽度
 *  @param font   字体大小
 *
 *  @return 高度
 */
- (CGFloat)calculateHeightWithWidth:(CGFloat)width
                               font:(UIFont *)font;

/**
 *  计算文字占用高度（行间距）
 *
 *  @param width  固定宽度
 *  @param font   字体大小
 *  @param LineSpacing 行间距
 *
 *  @return 高度
 */
- (CGFloat)calculateHeightWithWidth:(CGFloat)width
                               font:(UIFont *)font
                        LineSpacing:(CGFloat)LineSpacing;

/**
 *  计算文字占用高度（label计算）
 *
 *  @param width  固定宽度
 *  @param font   字体大小
 *
 *  @return 高度
 */
- (CGFloat)contentHeightWithWidth:(CGFloat)width
                             font:(UIFont *)font;

/**
 *  根据字符的长度计算label的宽度
 *
 *  @return label的宽度
 */
- (CGFloat)labelTextCountWidth;

/**
 *  根据字符的长度计算label的宽度
 *
 *  @return label的宽度
 */
- (CGFloat)labelTextCountWidthWithFont:(UIFont *)font;

/**
 身份证加隐藏
 
 @return 身份证加码
 */
-(NSString *)idCardString;

/**
 手机号加隐藏
 
 @return 手机号加码
 */
-(NSString *)phoneString;

@end

NS_ASSUME_NONNULL_END
