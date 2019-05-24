//
//  ZRInitView.m
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/1/8.
//  Copyright © 2019 rogue. All rights reserved.
//

#import "ZRInitView.h"

@implementation ZRInitView

@end

UIView *newView(void) {
    return [[UIView alloc] initWithFrame:CGRectZero];
}

UIImageView *newImageView(void) {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.userInteractionEnabled = YES;
    imageView.backgroundColor = [UIColor clearColor];
    return imageView;
}

UILabel *newLabel(void) {
    return [[UILabel alloc] initWithFrame:CGRectZero];
}

UILabel *newLabelNoLimitLines(void) {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    return label;
}

UITableView *newTable(void) {
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectZero];
    if (@available(iOS 11.0, *)) {
        table.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    table.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    /** iOS11下不想使用Self-Sizing的话，可以通过以下方式关闭，可以屏蔽上拉回弹问题 */
    table.estimatedRowHeight = 0;
    table.estimatedSectionHeaderHeight = 0;
    table.estimatedSectionFooterHeight = 0;
    table.showsVerticalScrollIndicator = NO;
    table.showsHorizontalScrollIndicator = NO;
    table.backgroundColor = [UIColor clearColor];
    table.separatorStyle = UITableViewCellSelectionStyleNone;
    UIView *clearView = [UIView new];
    clearView.backgroundColor = [UIColor clearColor];
    return table;
}

UITableView *newTableType(UITableViewStyle style) {
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    if (@available(iOS 11.0, *)) {
        table.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    table.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    /** iOS11下不想使用Self-Sizing的话，可以通过以下方式关闭，可以屏蔽上拉回弹问题 */
    table.estimatedRowHeight = 0;
    table.estimatedSectionHeaderHeight = 0;
    table.estimatedSectionFooterHeight = 0;
    table.showsVerticalScrollIndicator = NO;
    table.showsHorizontalScrollIndicator = NO;
    table.backgroundColor = [UIColor clearColor];
    table.separatorStyle = UITableViewCellSelectionStyleNone;
    UIView *clearView = [UIView new];
    clearView.backgroundColor = [UIColor clearColor];
    return table;
}

UIImage *newImage(NSString *imageName) {
    return [UIImage imageNamed:imageName];
}

UIButton *newButtonCustom(void) {
    return [UIButton buttonWithType:UIButtonTypeCustom];
}

UIButton *newButton(UIButtonType type) {
    return [UIButton buttonWithType:type];
}

UIScrollView *newScroll(void) {
    UIScrollView *scroll = [[UIScrollView alloc] init];
    scroll.showsVerticalScrollIndicator = NO;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.bounces = NO;
    return scroll;
}

UITextField *newTextField(void) {
    return [[UITextField alloc] init];
}

UITextView *newTextView(void) {
    return [[UITextView alloc] init];
}

UICollectionView *newCollectView(void){//默认竖
   return newCollectViewScrollDirection(UICollectionViewScrollDirectionVertical);
}

UICollectionView *newCollectViewScrollDirection(UICollectionViewScrollDirection scrollDirection){
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(50, 50);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.sectionInset = UIEdgeInsetsZero;
    layout.headerReferenceSize = CGSizeZero;
    layout.footerReferenceSize = CGSizeZero;
    layout.estimatedItemSize = CGSizeZero;
    layout.scrollDirection = scrollDirection;
    UICollectionView *collectView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    if (@available(iOS 11.0, *)) {
        collectView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    collectView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    /** iOS11下不想使用Self-Sizing的话，可以通过以下方式关闭，可以屏蔽上拉回弹问题 */
    collectView.showsVerticalScrollIndicator = NO;
    collectView.showsHorizontalScrollIndicator = NO;
    collectView.backgroundColor = [UIColor whiteColor];
    return collectView;
}
