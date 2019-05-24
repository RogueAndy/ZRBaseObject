//
//  ZRTimer.h
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/1/10.
//  Copyright © 2019 rogue. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZRTimer : NSObject

+ (dispatch_source_t)scheduledTimerWithTimeInterval:(NSTimeInterval)interval timeBegin:(void (^)(NSUInteger seconds))begin timeEnd:(void (^)(void))end;

@end

NS_ASSUME_NONNULL_END
