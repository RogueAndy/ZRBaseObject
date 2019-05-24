//
//  ZRColor.m
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/1/8.
//  Copyright © 2019 rogue. All rights reserved.
//

#import "ZRColor.h"

@implementation ZRColor

@end

UIColor *grayTheme(void) {
    return colorWithHex(0xEEEEEE);
}

UIColor *redTheme(void) {
    return colorWithHex(0xEC4B4B);
}

UIColor *lightBlack22(void) {
    return colorWithHex(0x222222);
}

UIColor *lightBlack33(void) {
    return colorWithHex(0x333333);
}

UIColor *lightBlack66(void) {
    return colorWithHex(0x666666);
}

UIColor *lightBlack96(void) {
    return colorWithHex(0x969696);
}

UIColor *lightBlack99(void) {
    return colorWithHex(0x999999);
}

UIColor *lightBlackC0(void) {
    return colorWithHex(0xC0C0C0);
}

UIColor *lightBlackDD(void) {
    return colorWithHex(0xDDDDDD);
}

UIColor *lightBlackEE(void) {
    return colorWithHex(0xEEEEEE);
}

UIColor *lightBlackF9(void) {
    return colorWithHex(0xF9F9F9);
}

UIColor *gray(void) {
    return [UIColor grayColor];
}

UIColor *white(void) {
    return [UIColor whiteColor];
}

UIColor *black(void) {
    return [UIColor blackColor];
}

UIColor *clear(void) {
    [UIFont systemFontOfSize:12 weight:12];
    return [UIColor clearColor];
}

UIColor *orange(void) {
    return [UIColor orangeColor];
}

UIColor *colorWithHexAlpha(UInt32 hex, float alpha) {
    CGFloat r = ((hex & 0xff0000) >> 16) / 255.f;
    CGFloat g = ((hex & 0x00ff00) >> 8) / 255.f;
    CGFloat b = (hex & 0x0000ff) / 255.f;
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}

UIColor *colorWithHex(UInt32 hex) {
    CGFloat r = ((hex & 0xff0000) >> 16) / 255.f;
    CGFloat g = ((hex & 0x00ff00) >> 8) / 255.f;
    CGFloat b = (hex & 0x0000ff) / 255.f;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

UIColor *colorWithRgbAlpha(float red, float green, float blue, float alpha) {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:green / 255.0 alpha:alpha];
}

UIColor *colorWithRgb(float red, float green, float blue) {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:green / 255.0 alpha:1.0];
}
