//
//  RunTrace.h
//  RunTrace
//
//  Created by 孙昕 on 15/9/18.
//  Copyright (c) 2015年 孙昕. All rights reserved.
//

#import <UIKit/UIKit.h>
//#define RunTraceOpen 1
#if DEBUG
    #if TARGET_IPHONE_SIMULATOR
        #define RunTraceOpen 1
    #else
        #define RunTraceOpen 0
    #endif
#endif

@interface RunTrace : UIView

@end
