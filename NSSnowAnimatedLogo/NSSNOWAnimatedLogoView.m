//
//  NSSNOWAnimatedLogoView.m
//  NSSnowAnimatedLogo
//
//  Created by Matt Glover on 23/02/2014.
//  Copyright (c) 2014 Duchy Software Ltd. All rights reserved.
//

static CGFloat kStrokeWidth = 6.0f;

#import "NSSNOWAnimatedLogoView.h"

@implementation NSSNOWAnimatedLogoView

- (id)initWithFrame:(CGRect)frame {
    
    // Make sure it is square.
    CGRect squareRect = [self squareFrameFromOriginalFrame:frame];
    if (self = [super initWithFrame:squareRect]) {
        
        [self setupBackground];
        [self setClipsToBounds:NO];
        
        [self animate:YES];
    }
    
    return self;
}

- (CGRect)squareFrameFromOriginalFrame:(CGRect)originalFrame {
    
    CGFloat maxWidthHeight = MAX(originalFrame.size.width, originalFrame.size.height);
    
    CGRect squareRect = CGRectMake(originalFrame.origin.x,
                                   originalFrame.origin.y,
                                   maxWidthHeight,
                                   maxWidthHeight);
    return squareRect;
}

- (void)setupBackground {
    [self setBackgroundColor:[UIColor blackColor]];
}

- (void)animate:(BOOL)animated {
    
    CALayer *outerCircle = [self outerCircleLayer];
    [self.layer addSublayer:outerCircle];
    
    NSTimeInterval animationDuration = animated ? 3.0f : 0.0f;
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = animationDuration;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    
    [outerCircle addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
}

- (CALayer *)outerCircleLayer {
    
    CAShapeLayer *outerCircle = [CAShapeLayer layer];
    [outerCircle setBounds:CGRectInset(self.bounds, kStrokeWidth, kStrokeWidth)];
    [outerCircle setPosition:CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2)];
    [outerCircle setPath:[UIBezierPath bezierPathWithRoundedRect:outerCircle.bounds
                                                    cornerRadius:CGRectGetWidth(outerCircle.bounds)/2].CGPath];
    [outerCircle setStrokeColor:[UIColor whiteColor].CGColor];
    [outerCircle setFillColor:self.backgroundColor.CGColor];
    [outerCircle setLineWidth:kStrokeWidth];
    
    return outerCircle;
}

@end
