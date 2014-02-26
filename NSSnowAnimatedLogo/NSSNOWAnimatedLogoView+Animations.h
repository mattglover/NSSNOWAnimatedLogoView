//
//  NSSNOWAnimatedLogoView+Animations.h
//  NSSnowAnimatedLogo
//
//  Created by Matt Glover on 26/02/2014.
//  Copyright (c) 2014 Duchy Software Ltd. All rights reserved.
//

#import "NSSNOWAnimatedLogoView.h"

extern NSString * const NSSnowAnimatedLogoViewAnimationKeyID;
extern NSString * const NSSNOWAnimatedLogoViewAnimationIDCircleStroke;

@interface NSSNOWAnimatedLogoView (Animations)

- (CABasicAnimation *)outerCircleStrokeAnimationWithDuration:(NSTimeInterval)animationDuration;
- (CABasicAnimation *)mountainAnimationWithMountainsLayer:(CAShapeLayer *)mountainsLayer
                                                 duration:(NSTimeInterval)animationDuration;
- (CABasicAnimation *)nssnowTextAnimationWithTextLayer:(CATextLayer *)textLayer
                                              duration:(NSTimeInterval)animationDuration;
@end
