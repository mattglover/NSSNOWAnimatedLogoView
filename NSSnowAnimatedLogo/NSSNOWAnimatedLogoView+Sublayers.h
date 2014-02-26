//
//  NSSNOWAnimatedLogoView+Sublayers.h
//  NSSnowAnimatedLogo
//
//  Created by Matt Glover on 26/02/2014.
//  Copyright (c) 2014 Duchy Software Ltd. All rights reserved.
//

#import "NSSNOWAnimatedLogoView.h"

@class NSSNOWYearOvalLayer;
@interface NSSNOWAnimatedLogoView (Sublayers)

- (CAShapeLayer *)outerCircleLayer;
- (CAShapeLayer *)mountainsLayer;
- (NSSNOWYearOvalLayer *)yearOvalLayer;
- (CATextLayer *)nssnowTextLayer;
- (CALayer *)maskLayer;

- (void)maskOuterCircle:(CAShapeLayer *)outerCircleLayer withMaskLayer:(CAShapeLayer *)maskLayer;
- (void)addYearString:(NSString *)yearString toYearOval:(CAShapeLayer *)yearOval;

@end
