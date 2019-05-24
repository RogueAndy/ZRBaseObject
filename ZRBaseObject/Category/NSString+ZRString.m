//
//  NSString+ZRString.m
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/3/18.
//  Copyright © 2019 rogue. All rights reserved.
//

#import "NSString+ZRString.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (ZRString)

#pragma mark - 加密
- (NSString *)md5 {
    
    if (self == nil || self.length == 0) {
        return @"";
    }
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr,(CC_LONG)strlen(cStr),result);
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)sha1 {
    
    const char *cstr = [self UTF8String];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

#pragma mark - 编码
//编码base64
- (NSString *)base64EncodedString {
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

//解码base64
- (NSString *)base64DecodedString {
    
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:0];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString *)stringToUTF8StringEncoding{
    return (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
}

#pragma mark - json转换
// json字符串转换成OC的数据结构
- (id)jsonToObejct {
    
    if (!self) {return nil;}
    NSError *error = nil;
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    if (jsonObject != nil && error == nil) {
        return jsonObject;
    }
    //解析错误
    return nil;
}

//json字符串转字典
- (NSDictionary *)jsonToDictionary {
    
    if (self == nil) {return nil;}
    NSError *err;
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {return nil;}
    return dic;
}

//json字符串转数组
- (NSArray *)jsonToArray {
    if (self == nil) {return nil;}
    NSError *err;
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:jsonData
                                                   options:NSJSONReadingMutableContainers
                                                     error:&err];
    if(err) {return nil;}
    return arr;
}

#pragma mark - 转换
// 汉字转拼音
- (NSString *)getPinyin {
    
    NSString *pinyin;
    if ([self length]) {
        NSMutableString *ms = [[NSMutableString alloc] initWithString:self];
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {
            
        }
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {
            
        }
        pinyin = ms;
    }
    return pinyin;
}

// 获取字符串首字母，如果首字母非字母，则返回"~"
- (NSString *)getFirstLetter {
    
    if (self.length) {
        NSString *regex = @"^[a-zA-Z]*$";
        NSString *firstLetter = [self substringToIndex:1];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        
        if ([predicate evaluateWithObject:firstLetter]) {
            return [firstLetter uppercaseString];
        }
        return @"~";
    }
    return @"~";
}

// 截取2者之间的字符串
- (NSString *)getStrBetweenStartStr:(NSString *)startStr andEndStr:(NSString *)endStr{
    NSRange startRange = [self rangeOfString:startStr];
    NSRange endRange = [self rangeOfString:endStr];
    NSRange range = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
    NSString *result = [self substringWithRange:range];
    return result;
}

/**
 截取某个字段之前的数据
 
 @param str 需要截取字段的分解符
 @return 返回截取字段
 */
- (NSString *)getBeforoStrByStr:(NSString *)str{
    NSRange rang = [self rangeOfString:str];//匹配得到的下标
    NSString *result  = [self substringToIndex:rang.location];//截取字符串获取url
    return result;
}

/**
 截取某个字段之前的数据
 
 @param str 需要截取字段的分解符
 @return 返回截取字段
 */
- (NSString *)getAfterStrByStr:(NSString *)str{
    NSRange rang = [self rangeOfString:str];//匹配得到的下标
    NSString *result  = [self substringFromIndex:rang.location+rang.length];//截取字符串获取url
    return result;
}

#pragma mark - 判断合
//// 是否包含在白名单
//- (BOOL)isIncludedInWhiteList {
//    //1. 是否需要判断
//    CQAPPManager *manager = [CQAPPManager shared];
//    if (!manager.isEnabledWhiteList) {
//        return true;
//    }
//    if ([self isEqualToString:@"about:blank"]) {
//        // 跳转***************
//        return true;
//    }
//    //2. 域名
//    NSArray *urls = [self componentsSeparatedByString:@"/"];
//    if (urls.count < 2) {
//        return false;
//    }
//    NSString *domainName = urls[2];
//    //3. 白名单
//    if ([domainName containsString:manager.whiteList]) {
//        return true;
//    }
//    return false;
//}

// 字符串是为空（包括全空格）
- (BOOL)isEmpty {
    
    if (self.length >0 && [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]length]!=0 ) {
        return NO;
    }else{
        return YES;
    }
}

//判断手机号
- (BOOL)validateMobile {
    
    if (self.length != 11) {
        return NO;
    }else{
        return YES;
    }
    
    
    /*
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188  新增移动198（0-9）号段
     
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186                               新增联通166（0-9）号段
     
     * 中国电信：China Telecom
     * 133,1349,153,180,189                                          新增电信199（0-9）号段
     
     */
    //    NSString *MOBILE = @"^1[3-8]\\d{9}$";
    //    NSString *CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    //    NSString *CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    //    NSString *CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    NSString *MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9]|9[89])\\d{8}$";
    NSString *CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278]|98[0-9])\\d)\\d{7}$";
    NSString *CU = @"^1(3[0-2]|5[256]|8[56]|66)\\d{8}$";
    NSString *CT = @"^1((33|53|8[09])[0-9]|349|99[0-9])\\d{7}$";
    
    NSPredicate *regexMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",MOBILE];
    NSPredicate *regexCM = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CM];
    NSPredicate *regexCU = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CU];
    NSPredicate *regexCT = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CT];
    if ([regexMobile evaluateWithObject:self] || [regexCM evaluateWithObject:self] || [regexCU evaluateWithObject:self] || [regexCT evaluateWithObject:self]) {
        
        return YES;
    }else {
        return NO;
    }
}

//判断邮箱
- (BOOL)validateEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

//验证身份证号码是否正确的方法
- (BOOL)validateCardNO {
    
    if (self.length != 18) return NO;
    // 正则表达式判断基本 身份证号是否满足格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityStringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(![identityStringPredicate evaluateWithObject:self]) return NO;
    
    //** 开始进行校验 *//
    
    //将前17位加权因子保存在数组里
    NSArray *idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
    
    //这是除以11后，可能产生的11位余数、验证码，也保存成数组
    NSArray *idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
    
    //用来保存前17位各自乖以加权因子后的总和
    NSInteger idCardWiSum = 0;
    for(int i = 0;i < 17;i++) {
        NSInteger subStrIndex = [[self substringWithRange:NSMakeRange(i, 1)] integerValue];
        NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
        idCardWiSum+= subStrIndex * idCardWiIndex;
    }
    
    //计算出校验码所在数组的位置
    NSInteger idCardMod=idCardWiSum%11;
    //得到最后一位身份证号码
    NSString *idCardLast= [self substringWithRange:NSMakeRange(17, 1)];
    //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
    if(idCardMod==2) {
        if(![idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"]) {
            return NO;
        }
    }
    else{
        //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
        if(![idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]]) {
            return NO;
        }
    }
    return YES;
}

//// 获取可用的UrlSting
//- (NSString *)availableUrlString {
//    
//    NSString *urlStr = [self stringByReplacingOccurrencesOfString:@" "
//                                                       withString:@""];
//    if ([urlStr containsString:@"CqlivingCloud.app"]) {
//        
//        return urlStr;
//    }else {
//        if (![urlStr hasPrefix:@"http"]) {
//            urlStr = [NSString stringWithFormat:@"http://%@",urlStr];
//        }
//        if ([Utils isShowNoneImage]) {
//            if ([urlStr containsString:@"?"]) {
//                urlStr = [NSString stringWithFormat:@"%@&noimg=noimg",urlStr];
//            }else {
//                urlStr = [NSString stringWithFormat:@"%@?&noimg=noimg",urlStr];
//            }
//        }
//        return urlStr;
//    }
//}

#pragma mark - 计算字符串宽度、高度
//计算文字占用宽度
- (CGFloat)calculateWidthWithHeight:(CGFloat)height
                               font:(UIFont *)font {
    
    return [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName: font}
                              context:NULL].size.width;
}

//计算文字占用高度
- (CGFloat)calculateHeightWithWidth:(CGFloat)width
                               font:(UIFont *)font {
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName: font}
                              context:NULL].size.height;
}

//计算文字占用高度（行间距）
- (CGFloat)calculateHeightWithWidth:(CGFloat)width
                               font:(UIFont *)font
                        LineSpacing:(CGFloat)LineSpacing {
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = LineSpacing;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:dic context:nil].size;
    return size.height;
}

//计算内容高度
- (CGFloat)contentHeightWithWidth:(CGFloat)width
                             font:(UIFont *)font{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 0)];
    label.numberOfLines = 0;
    label.font = font;
    label.text = self;
    [label sizeToFit];
    return CGRectGetHeight(label.frame);
}

//根据字符的长度计算label的宽度
- (CGFloat)labelTextCountWidth {
    
    if (self.length == 1) {
        return 18;
    }else if (self.length == 2){
        return 28;
    }else if (self.length == 3){
        return 36;
    }else {
        return 48;
    }
}

- (CGFloat)labelTextCountWidthWithFont:(UIFont *)font{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    label.numberOfLines = 1;
    label.font = font;
    label.text = self;
    [label sizeToFit];
    return CGRectGetWidth(label.frame);
}

-(NSString *)idCardString{
    NSString *tel = [self stringByReplacingCharactersInRange:NSMakeRange(3, 13) withString:@"*************"];
    return tel;
}

-(NSString *)phoneString{
    NSString *tel = [self stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    return tel;
}

@end
