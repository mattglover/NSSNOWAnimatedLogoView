//
//  NSSNOWAnimatedLogoView+Animations.m
//  NSSnowAnimatedLogo
//
//  Created by Matt Glover on 26/02/2014.
//  Copyright (c) 2014 Duchy Software Ltd. All rights reserved.
//

#import "NSSNOWAnimatedLogoView+Animations.h"

@implementation NSSNOWAnimatedLogoView (Animations)

- (CABasicAnimation *)outerCircleAnimation:(NSTimeInterval)animationDuration {
        
    CABasicAnimation *circleAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    [circleAnimation setValue:@"circleStrokeEndAnimation" forKey:@"id"];
    [circleAnimation setDelegate:self];
    circleAnimation.duration = animationDuration;
    circleAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    circleAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    
    return circleAnimation;
}

- (CABasicAnimation *)mountainAnimationWithMountainsLayer:(CAShapeLayer *)mountainsLayer
                                                  duration:(NSTimeInterval)animationDuration {
    
    CATransform3D originTransform       = mountainsLayer.transform;
    CATransform3D destinationTransform  = CATransform3DIdentity;
    
    [mountainsLayer setTransform:destinationTransform];
    
    CABasicAnimation *mountainAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    [mountainAnimation setValue:@"mountainsTransformAnimation" forKey:@"id"];
    [mountainAnimation setDelegate:self];
    mountainAnimation.duration = animationDuration;
    mountainAnimation.fromValue = [NSValue valueWithCATransform3D:originTransform];
    mountainAnimation.toValue   = [NSValue valueWithCATransform3D:destinationTransform];
    
    return mountainAnimation;
}

@end
