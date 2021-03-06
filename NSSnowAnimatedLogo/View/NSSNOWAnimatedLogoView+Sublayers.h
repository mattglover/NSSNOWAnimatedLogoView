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
- (CAShapeLayer *)skiTracksLayer;
- (NSSNOWYearOvalLayer *)yearOvalLayer;
- (CATextLayer *)nssnowTextLayer;
- (CALayer *)maskLayer;

@end
