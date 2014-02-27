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
NSString * const NSSNOWAnimatedLogoViewAnimationIDMountainOpacity   = @"mountainOpacityAnimation";

@implementation NSSNOWAnimatedLogoView (Animations)

- (CABasicAnimation *)outerCircleStrokeAnimationWithDuration:(NSTimeInterval)animationDuration {
    return [self strokeEndAnimationWithDuration:animationDuration withID:NSSNOWAnimatedLogoViewAnimationIDCircleStroke];
}

- (CABasicAnimation *)mountainAnimationWithMountainsLayer:(CAShapeLayer *)mountainsLayer
                                                 duration:(NSTimeInterval)animationDuration {
    return [self showLayerAnimation:mountainsLayer duration:animationDuration withID:NSSNOWAnimatedLogoViewAnimationIDMountainOpacity];
}

- (CABasicAnimation *)skiTracksStrokeAnimationWithDuration:(NSTimeInterval)animationDuration {
    return [self strokeEndAnimationWithDuration:animationDuration withID:nil];
}

- (CABasicAnimation *)yearOvalTransformAnimationWithLayer:(CALayer *)layer duration:(NSTimeInterval)animationDuration {
    
    CATransform3D originTransform      = layer.transform;
    CATransform3D destinationTransform = CATransform3DIdentity;;
    
    [layer setTransform:destinationTransform];
    
    CABasicAnimation *yearOvalTransform = [CABasicAnimation animationWithKeyPath:@"transform"];
    [yearOvalTransform setDelegate:self];
    [yearOvalTransform setDuration:animationDuration];
    [yearOvalTransform setFromValue:[NSValue valueWithCATransform3D:originTransform]];
    [yearOvalTransform setToValue:[NSValue valueWithCATransform3D:destinationTransform]];
    
    return yearOvalTransform;
}

- (CABasicAnimation *)nssnowTextAnimationWithTextLayer:(CATextLayer *)textLayer
                                              duration:(NSTimeInterval)animationDuration {
    return [self showLayerAnimation:textLayer duration:animationDuration withID:nil];
}

#pragma mark - Private Methods
- (CABasicAnimation *)showLayerAnimation:(CALayer *)layer duration:(NSTimeInterval)animationDuration withID:(NSString *)animationID {
    
    CGFloat originOpacity       = layer.opacity;
    CGFloat destinationOpacity  = 1.0f;
    
    [layer setOpacity:destinationOpacity];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [animation setValue:animationID forKey:NSSnowAnimatedLogoViewAnimationKeyID];
    [animation setDelegate:self];
    [animation setDuration:animationDuration];
    [animation setFromValue:@(originOpacity)];
    [animation setToValue:@(destinationOpacity)];
    
    return animation;
}

- (CABasicAnimation *)strokeEndAnimationWithDuration:(NSTimeInterval)animationDuration withID:(NSString *)animationID {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    [animation setValue:animationID forKey:NSSnowAnimatedLogoViewAnimationKeyID];
    [animation setDelegate:self];
    [animation setDuration:animationDuration];
    [animation setFromValue:[NSNumber numberWithFloat:0.0f]];
    [animation setToValue:[NSNumber numberWithFloat:1.0f]];
    
    return animation;
    
}

@end
