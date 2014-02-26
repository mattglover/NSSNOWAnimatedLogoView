//
//  NSSNOWAnimatedLogoView+Animations.m
//  NSSnowAnimatedLogo
//
//  Created by Matt Glover on 26/02/2014.
//  Copyright (c) 2014 Duchy Software Ltd. All rights reserved.
//

#import "NSSNOWAnimatedLogoView+Animations.h"

NSString * const NSSnowAnimatedLogoViewAnimationKeyID               = @"id";
NSString * const NSSNOWAnimatedLogoViewAnimationIDCircleStroke      = @"circleStrokeEndAnimation";
NSString * const NSSNOWAnimatedLogoViewAnimationIDMountainOpacity   = @"mountainsOpacityAnimation";

@implementation NSSNOWAnimatedLogoView (Animations)

- (CABasicAnimation *)outerCircleAnimation:(NSTimeInterval)animationDuration {
        
    CABasicAnimation *circleAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    [circleAnimation setValue:NSSNOWAnimatedLogoViewAnimationIDCircleStroke forKey:NSSnowAnimatedLogoViewAnimationKeyID];
    [circleAnimation setDelegate:self];
    circleAnimation.duration = animationDuration;
    circleAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    circleAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    
    return circleAnimation;
}

- (CABasicAnimation *)mountainAnimationWithMountainsLayer:(CAShapeLayer *)mountainsLayer
                                                  duration:(NSTimeInterval)animationDuration {
    
    CGFloat originOpacity       = mountainsLayer.opacity;
    CGFloat destinationOpacity  = 1.0f;
    
    [mountainsLayer setOpacity:destinationOpacity];
    
    CABasicAnimation *mountainAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [mountainAnimation setValue:NSSNOWAnimatedLogoViewAnimationIDMountainOpacity forKey:NSSnowAnimatedLogoViewAnimationKeyID];
    [mountainAnimation setDelegate:self];
    mountainAnimation.duration = animationDuration;
    mountainAnimation.fromValue = @(originOpacity);
    mountainAnimation.toValue   = @(destinationOpacity);
    
    return mountainAnimation;
}

@end
