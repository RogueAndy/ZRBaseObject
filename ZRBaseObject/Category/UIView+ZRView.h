//
//  UIView+ZRView.h
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/3/18.
//  Copyright © 2019 rogue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@protocol ZRLoadViewsProtocols <NSObject>

@optional
- (void)ZR_addSubViews;
- (void)ZR_configerSubView;
- (void)ZR_loadLayouts;
- (void)ZR_getData;
- (void)ZR_refreshData:(id _Nonnull )data;
@end

NS_ASSUME_NONNULL_BEGIN
typedef void (^ZRGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (ZRView)<ZRLoadViewsProtocols>

@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (strong, nonatomic) IBInspectable UIColor *borderColor;

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;
@property (assign, nonatomic) CGFloat  hight;
@property (assign, nonatomic) CGFloat  width;

/**
 返回当前页面的 ViewController

 @return ViewController对象
 */
- (UIViewController *)firstAvailableUIViewController;

//获取顶部vc,不适用pageVC
- (UIViewController*)getTopViewController;

+ (UIViewController *)getTopViewController;

//获取子视图
- (id)ZR_findSubViewWithSubViewClass:(Class)clazz;

//获取父视图
- (id)ZR_findsuperViewWithSuperViewClass:(Class)clazz;

/**
 *  @brief  添加tap手势
 *
 *  @param block 代码块
 */
- (void)ZR_addTapActionWithBlock:(ZRGestureActionBlock)block;

/**
 *  @brief  添加长按手势
 *
 *  @param block 代码块
 */
- (void)ZR_addLongPressActionWithBlock:(ZRGestureActionBlock)block;

/**
 获取table
 
 @return UITableView
 */
- (UITableView *)ZR_getTableView;

/**
 获取CollectionView
 
 @return CollectionView
 */
- (UICollectionView *)ZR_getCollectionView;

/**
 获取WkWebView
 
 @return WkWebView
 */
- (WKWebView *)ZR_getWkWebView;
@end

NS_ASSUME_NONNULL_END
