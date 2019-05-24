//
//  ZRTimer.m
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/1/10.
//  Copyright © 2019 rogue. All rights reserved.
//

#import "ZRTimer.h"

@implementation ZRTimer

+ (dispatch_source_t)scheduledTimerWithTimeInterval:(NSTimeInterval)interval timeBegin:(void (^)(NSUInteger seconds))begin timeEnd:(void (^)(void))end {
    __block int timeOut = interval;
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (timeOut == 0) {
            dispatch_source_cancel(timer);
            dispatch_sync(dispatch_get_main_queue(), ^{
                end();
            });
        }else {
            dispatch_sync(dispatch_get_main_queue(), ^{
                begin(timeOut);
            });
        }
        timeOut--;
    });
    dispatch_resume(timer);
    
    return timer;
}

@end
