//
//  UIView+ZRView.m
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/3/18.
//  Copyright © 2019 rogue. All rights reserved.
//

#import "UIView+ZRView.h"
#import <objc/runtime.h>
static char ZR_kActionHandlerTapBlockKey;
static char ZR_kActionHandlerTapGestureKey;
static char ZR_kActionHandlerLongPressBlockKey;
static char ZR_kActionHandlerLongPressGestureKey;

@implementation UIView (ZRView)
@dynamic cornerRadius;
@dynamic borderWidth;
@dynamic borderColor;

- (void)ZR_addSubViews{}
- (void)ZR_configerSubView{}
- (void)ZR_loadLayouts{}
- (void)ZR_getData{}
- (void)ZR_refreshData:(id _Nonnull)data{}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = (cornerRadius>0);
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)x{
    return  self.frame.origin.x;
}

- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y{
    return self.frame.origin.y;
}

- (CGFloat)centerX{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX{
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY{
    self.center = CGPointMake(self.center.x, centerY);
}

- (void)setWidth:(CGFloat)width{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}

- (CGFloat)width{
    return self.frame.size.width;
}

- (void)setHight:(CGFloat)hight{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, hight);
}

- (CGFloat)hight{
    return self.frame.size.height;
}

- (UIViewController *)firstAvailableUIViewController {
    return (UIViewController *)[self traverseResponderChainForUIViewController];
}

- (UIViewController*)getTopViewController {
    UIViewController *rootVc = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [self topViewControllerWithRootViewController:rootVc];
}

+ (UIViewController *)getTopViewController{
    UIViewController *rootVc = [UIApplication sharedApplication].delegate.window.rootViewController;
    UIView *view = rootVc.view;
    return [view topViewControllerWithRootViewController:(UIViewController *)rootVc];
}

- (UIViewController *)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* nav = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:nav.visibleViewController];
    }else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

- (id)traverseResponderChainForUIViewController {
    id nextResponder = [self nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return nextResponder;
    } else if ([nextResponder isKindOfClass:[UIView class]]) {
        return [nextResponder traverseResponderChainForUIViewController];
    } else {
        return nil;
    }
}

- (id)ZR_findSubViewWithSubViewClass:(Class)clazz{
    for (id subView in self.subviews) {
        if ([subView isKindOfClass:clazz]) { return subView;}
    }
    return nil;
}

- (id)ZR_findsuperViewWithSuperViewClass:(Class)clazz{
    if (self == nil) {
        return nil;
    } else if (self.superview == nil) {
        return nil;
    } else if ([self.superview isKindOfClass:clazz]) {
        return self.superview;
    } else {
        return [self.superview ZR_findsuperViewWithSuperViewClass:clazz];
    }
}

- (void)ZR_addTapActionWithBlock:(ZRGestureActionBlock)block{
    self.userInteractionEnabled = true;
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &ZR_kActionHandlerTapGestureKey);
    if (!gesture){
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ZR_handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &ZR_kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &ZR_kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)ZR_handleActionForTapGesture:(UITapGestureRecognizer*)gesture{
    if (gesture.state == UIGestureRecognizerStateRecognized){
        ZRGestureActionBlock block = objc_getAssociatedObject(self, &ZR_kActionHandlerTapBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}

- (void)ZR_addLongPressActionWithBlock:(ZRGestureActionBlock)block{
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &ZR_kActionHandlerLongPressGestureKey);
    if (!gesture){
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(ZR_handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &ZR_kActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &ZR_kActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)ZR_handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture{
    if (gesture.state == UIGestureRecognizerStateRecognized){
        ZRGestureActionBlock block = objc_getAssociatedObject(self, &ZR_kActionHandlerLongPressBlockKey);
        if (block){
            block(gesture);
        }
    }
}

//获取table
- (UITableView *)ZR_getTableView{
    //在cell中
    UITableView *table = [self ZR_findsuperViewWithSuperViewClass:[UITableView class]];
    if (table) {
        return table;
    }
    
    //在和TableVIew同一个vc中的View
    table = [self.firstAvailableUIViewController.view ZR_findSubViewWithSubViewClass:[UITableView class]];
    if (table) {
        return table;
    }
    
    //当自己和table产生不了关系时同一个vc中的View ,不使用多级栏目
    table = [self.getTopViewController.view ZR_findSubViewWithSubViewClass:[UITableView class]];
    if (table) {
        return table;
    }
    return nil;
}

//获取CollectionView
- (UICollectionView *)ZR_getCollectionView{
    //在cell中
    UICollectionView *collection = [self ZR_findsuperViewWithSuperViewClass:[UICollectionView class]];
    if (collection) {
        return collection;
    }
    
    //在和collection同一个vc中的View
    collection = [self.firstAvailableUIViewController.view ZR_findSubViewWithSubViewClass:[UICollectionView class]];
    if (collection) {
        return collection;
    }
    
    //当自己和collection产生不了关系时同一个vc中的View ,不使用多级栏目
    collection = [self.getTopViewController.view ZR_findSubViewWithSubViewClass:[UICollectionView class]];
    if (collection) {
        return collection;
    }
    return nil;
}

//获取WkWebView
- (WKWebView *)ZR_getWkWebView{
    //在和collection同一个vc中的View
    WKWebView *web = [self.firstAvailableUIViewController.view ZR_findSubViewWithSubViewClass:[WKWebView class]];
    if (web) {
        return web;
    }
    
    //在WKWebView上的View
    web = [self ZR_findsuperViewWithSuperViewClass:[WKWebView class]];
    if (web) {
        return web;
    }
    
    //当自己和collection产生不了关系时同一个vc中的View ,不使用多级栏目
    web = [self.getTopViewController.view ZR_findSubViewWithSubViewClass:[WKWebView class]];
    if (web) {
        return web;
    }
    return nil;
}
@end
