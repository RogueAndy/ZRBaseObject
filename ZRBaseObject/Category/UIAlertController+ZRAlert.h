//
//  UIAlertController+ZRAlert.h
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/3/18.
//  Copyright © 2019 rogue. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ZRActionHandler)(UIAlertAction *action);
typedef void(^ZRActionSheetHandler)(UIAlertAction *action,NSInteger selectIndex);

@interface UIAlertController (ZRAlert)

/**
 UIAlertControllerStyleAlert
 
 @param title 标题
 @param msg 详情
 @param sure 确定标题
 @param cancel 取消标题
 @param sureHandler 确定回调
 @param cacelHandler 取消回调
 @return UIAlertController(类型为UIAlertControllerStyleAlert)
 */
+ (UIAlertController *)alertWithTitle:(NSString *)title
                              message:(NSString *)msg
                            sureTitle:(NSString *)sure
                          cancelTitle:(NSString *)cancel
                          sureHandler:(__nullable ZRActionHandler)sureHandler
                        cancelHandler:(__nullable ZRActionHandler)cacelHandler;

/**
 UIAlertControllerStyleAlert
 
 @param title 标题
 @param msg 详情
 @param sure 确定标题
 @param sureHandler 确定回调
 @return UIAlertController(类型为UIAlertControllerStyleAlert)
 */
+ (UIAlertController *)alertWithTitle:(NSString *)title
                              message:(NSString *)msg
                            sureTitle:(NSString *)sure
                          sureHandler:(__nullable ZRActionHandler)sureHandler;


/**
 UIAlertControllerStyleActionSheet
 
 @param title 标题
 @param msg 详情
 @param expandArray 选择按钮
 @param cancel 取消按钮
 @param defaultColorArray defaultColorArray
 @param cancleColor 取消按钮颜色
 @param actionHandler 返回点击ActionHandler
 @return UIAlertController
 */
+(UIAlertController *)alertActionSheetWithTitle:(NSString *)title
                                        message:(NSString *)msg
                                    expandArray:(NSArray <NSString *>*)expandArray
                                    cancelTitle:(NSString *)cancel
                         alertDefaultColorArray:(NSArray <UIColor *>*)defaultColorArray
                               alertCancleColor:(UIColor *)cancleColor
                                  actionHandler:(__nullable ZRActionHandler)actionHandler;
/**
 UIAlertControllerStyleActionSheet
 
 @param title 标题
 @param msg 详情
 @param expandArray 选择按钮
 @param cancel 取消按钮
 @param defaultColorArray defaultColorArray
 @param cancleColor 取消按钮颜色
 @param actionHandler 返回点击ActionHandler
 @return UIAlertController
 */
+(UIAlertController *)alertActionSheetIndexWithTitle:(NSString *)title
                                             message:(NSString *)msg
                                         expandArray:(NSArray <NSString *>*)expandArray
                                         cancelTitle:(NSString *)cancel
                              alertDefaultColorArray:(NSArray <UIColor *>*)defaultColorArray
                                    alertCancleColor:(UIColor *)cancleColor
                                       actionHandler:(__nullable ZRActionSheetHandler)actionHandler;

@end

NS_ASSUME_NONNULL_END
