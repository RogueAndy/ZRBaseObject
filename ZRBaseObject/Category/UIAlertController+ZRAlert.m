//
//  UIAlertController+ZRAlert.m
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/3/18.
//  Copyright © 2019 rogue. All rights reserved.
//

#import "UIAlertController+ZRAlert.h"
#import "ZRMacro.h"

@implementation UIAlertController (ZRAlert)

+ (UIAlertController *)alertWithTitle:(NSString *)title
                              message:(NSString *)msg
                            sureTitle:(NSString *)sure
                          cancelTitle:(NSString *)cancel
                          sureHandler:(__nullable ZRActionHandler)sureHandler
                        cancelHandler:(__nullable ZRActionHandler)cacelHandler {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:msg
                                                            preferredStyle:UIAlertControllerStyleAlert];
    if (!ZR_StringIsEmpty(sure)) {
        UIAlertAction *s = [UIAlertAction actionWithTitle:sure
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction * _Nonnull action) {
                                                      if (sureHandler) {
                                                          sureHandler(action);
                                                      }
                                                  }];
        [alert addAction:s];
    }
    
    if (!ZR_StringIsEmpty(cancel)) {
        
        UIAlertAction *c = [UIAlertAction actionWithTitle:cancel
                                                    style:UIAlertActionStyleCancel
                                                  handler:^(UIAlertAction * _Nonnull action) {
                                                      if (cacelHandler) {
                                                          cacelHandler(action);
                                                      }
                                                  }];
        
        [alert addAction:c];
    }
    
    return alert;
}

+ (UIAlertController *)alertWithTitle:(NSString *)title
                              message:(NSString *)msg
                            sureTitle:(NSString *)sure
                          sureHandler:(__nullable ZRActionHandler)sureHandler{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:msg
                                                            preferredStyle:UIAlertControllerStyleAlert];
    if (!ZR_StringIsEmpty(sure)) {
        UIAlertAction *s = [UIAlertAction actionWithTitle:sure
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction * _Nonnull action) {
                                                      if (sureHandler) {
                                                          sureHandler(action);
                                                      }
                                                  }];
        [alert addAction:s];
    }
    return alert;
}

+(UIAlertController *)alertActionSheetWithTitle:(NSString *)title
                                        message:(NSString *)msg
                                    expandArray:(NSArray <NSString *>*)expandArray
                                    cancelTitle:(NSString *)cancel
                         alertDefaultColorArray:(NSArray <UIColor *>*)defaultColorArray
                               alertCancleColor:(UIColor *)cancleColor
                                  actionHandler:(__nullable ZRActionHandler)actionHandler{
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:title
                                                                       message:msg
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i = 0; i<expandArray.count; i++) {
        UIAlertAction *b = [UIAlertAction actionWithTitle:expandArray[i]
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction * _Nonnull action) {
                                                      if (actionHandler) {
                                                          actionHandler(action);
                                                      }
                                                  }];
        if (defaultColorArray.count == expandArray.count&&
            [defaultColorArray[i] isKindOfClass:[UIColor class]]) {
            [b setValue:defaultColorArray[i] forKey:@"_titleTextColor"];
        }
        [alertView addAction:b];
    }
    if (cancel) {
        UIAlertAction *cancle = [UIAlertAction actionWithTitle:cancel
                                                         style:UIAlertActionStyleCancel
                                                       handler:nil];
        [cancle setValue:cancleColor forKey:@"_titleTextColor"];
        [alertView addAction:cancle];
    }
    return alertView;
}

+(UIAlertController *)alertActionSheetIndexWithTitle:(NSString *)title
                                             message:(NSString *)msg
                                         expandArray:(NSArray <NSString *>*)expandArray
                                         cancelTitle:(NSString *)cancel
                              alertDefaultColorArray:(NSArray <UIColor *>*)defaultColorArray
                                    alertCancleColor:(UIColor *)cancleColor
                                       actionHandler:(__nullable ZRActionSheetHandler)actionHandler{
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:title
                                                                       message:msg
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i = 0; i<expandArray.count; i++) {
        UIAlertAction *b = [UIAlertAction actionWithTitle:expandArray[i]
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction * _Nonnull action) {
                                                      if (actionHandler) {
                                                          actionHandler(action,i);
                                                      }
                                                  }];
        if (defaultColorArray.count == expandArray.count&&
            [defaultColorArray[i] isKindOfClass:[UIColor class]]) {
            [b setValue:defaultColorArray[i] forKey:@"_titleTextColor"];
        }
        [alertView addAction:b];
    }
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消"
                                                     style:UIAlertActionStyleCancel
                                                   handler:nil];
    [cancle setValue:cancleColor forKey:@"_titleTextColor"];
    [alertView addAction:cancle];
    return alertView;
}

@end
