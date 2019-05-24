//
//  ZRColor.h
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/1/8.
//  Copyright © 2019 rogue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZRColor : NSObject

@end

UIColor *gray(void);
UIColor *orange(void);
UIColor *clear(void);
UIColor *white(void);
UIColor *black(void);

UIColor *grayTheme(void);
UIColor *redTheme(void);
UIColor *lightBlack22(void);
UIColor *lightBlack33(void);
UIColor *lightBlack66(void);
UIColor *lightBlack96(void);
UIColor *lightBlack99(void);
UIColor *lightBlackC0(void);
UIColor *lightBlackDD(void);
UIColor *lightBlackEE(void);
UIColor *lightBlackF9(void);

UIColor *colorWithHexAlpha(UInt32 hex, float alpha);
UIColor *colorWithHex(UInt32 hex);
UIColor *colorWithRgbAlpha(float red, float green, float blue, float alpha);
UIColor *colorWithRgb(float red, float green, float blue);

NS_ASSUME_NONNULL_END
