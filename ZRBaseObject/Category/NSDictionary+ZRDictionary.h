//
//  NSDictionary+ZRDictionary.h
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/1/10.
//  Copyright © 2019 rogue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (ZRDictionary)

/**
 *  字典解析获取id类型
 *
 *  @param key 字符串key
 *
 *  @return 如果有值，则返回，无，则返回一个空字典@{}
 */
- (id)dicValueforKey:(NSString *)key;

/**
 *  字典解析获取BOOL
 *
 *  @param key 字符串key
 *
 *  @return BOOL
 */
- (BOOL)dicBOOLForKey:(NSString *)key;

/**
 *  字典解析获取字符串
 *
 *  @param key 字符串key
 *
 *  @return 字符串
 */
- (NSString *)dicStringForKey:(NSString *)key;

/**
 *  字典解析获取int
 *
 *  @param key 字符串key
 *
 *  @return int
 */
- (int)dicIntForKey:(NSString *)key;

/**
 *  字典解析获取NSInteger
 *
 *  @param key NSInteger
 *
 *  @return 字符串
 */
- (NSInteger)dicIntegerForKey:(NSString *)key;

/**
 *  字典解析获取float
 *
 *  @param key 字符串key
 *
 *  @return float
 */
- (CGFloat)dicFloatForKey:(NSString *)key;

/**
 *  字典解析获取数组
 *
 *  @param key 字符串key
 *
 *  @return 数组串
 */
- (NSArray *)dicArrayForKey:(NSString *)key;

/**
 *  字典解析后分隔字符串获取数组
 *
 *  @param key       字符串key
 *  @param separator 分隔符
 *
 *  @return 分割后的数组
 */
- (NSArray *)dicArrayForKey:(NSString *)key
          separatedByString:(NSString *)separator;



/**
 //获取以逗号隔开并且剔除空字符串
 
 @param key       字符串key
 @param separator 分隔符
 
 @return 分割后的数组
 */
-(NSArray *)dicArrayContentForKey:(NSString *)key
                separatedByString:(NSString *)separator;

/**
 字典转NSdata
 */
-(NSString *)JSONString;

@end

NS_ASSUME_NONNULL_END
