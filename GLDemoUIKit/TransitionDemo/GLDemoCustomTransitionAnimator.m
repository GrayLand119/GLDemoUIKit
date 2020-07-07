//
//  GLDemoCustomTransitionAnimator.m
//  GLUIKit_Example
//
//  Created by GrayLand on 2020/3/18.
//  Copyright © 2020 GrayLand119. All rights reserved.
//

#import "GLDemoCustomTransitionAnimator.h"

@implementation GLDemoCustomTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView isPresenting:(BOOL)isPresenting inContainerView:(UIView *)containerView {
    
    CGRect fromFrame = [transitionContext initialFrameForViewController:fromVC];
    CGRect toFrame = [transitionContext finalFrameForViewController:toVC];
    DDLog(@"[GLCustomTransition] %@", isPresenting?@"isPresenting":@"isDismissing")
    DDLog(@"fromView:%@ fromFrame: %@", fromView, NSStringFromCGRect(fromFrame))
    DDLog(@"toView:%@ toFrame: %@", toView, NSStringFromCGRect(toFrame))
    CGFloat width = 275;
    if (isPresenting) {
        toView.frame = CGRectMake(SCREEN_WIDTH, 0, width, SCREEN_HEIGHT);
        [containerView addSubview:toView];
    } else {
//        toView.frame = CGRectMake(-offset, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//        fromView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//        [containerView insertSubview:toView belowSubview:fromView];
    }
    
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:transitionDuration animations:^{
        if (isPresenting) {
            toView.frame = CGRectMake(SCREEN_WIDTH-width, 0, width, SCREEN_HEIGHT);
            fromVC.view.frame = CGRectMake(-width, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        } else {
            toVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            fromView.frame = CGRectMake(SCREEN_WIDTH, 0, width, SCREEN_HEIGHT);
        }
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        if (wasCancelled) {
            [toView removeFromSuperview];
        }
        [transitionContext completeTransition:!wasCancelled];
    }];
}


@end
