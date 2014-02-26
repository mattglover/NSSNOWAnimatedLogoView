//
//  NSSNOWYearOvalLayer.h
//  NSSnowAnimatedLogo
//
//  Created by Matt Glover on 26/02/2014.
//  Copyright (c) 2014 Duchy Software Ltd. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface NSSNOWYearOvalLayer : CAShapeLayer

- (void)setYearString:(NSString *)yearString;
- (void)displayYearStringWithAnimationDuration:(NSTimeInterval)animationDuration;

@end
