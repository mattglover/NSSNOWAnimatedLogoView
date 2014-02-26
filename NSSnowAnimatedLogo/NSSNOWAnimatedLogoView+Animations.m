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

@implementation NSSNOWAnimatedLogoView (Animations)

- (CABasicAnimation *)outerCircleStrokeAnimationWithDuration:(NSTimeInterval)animationDuration {
        
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
    return [self showLayer:mountainsLayer duration:animationDuration];
}

- (CABasicAnimation *)nssnowTextAnimationWithTextLayer:(CATextLayer *)textLayer
                                              duration:(NSTimeInterval)animationDuration {
    return [self showLayer:textLayer duration:animationDuration];
}

- (CABasicAnimation *)showLayer:(CALayer *)layer duration:(NSTimeInterval)animationDuration {
    
    CGFloat originOpacity       = layer.opacity;
    CGFloat destinationOpacity  = 1.0f;
    
    [layer setOpacity:destinationOpacity];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [animation setDelegate:self];
    animation.duration = animationDuration;
    animation.fromValue = @(originOpacity);
    animation.toValue   = @(destinationOpacity);
    
    return animation;
}

@end
