//
//  NSSNOWAnimatedLogoView+Sublayers.m
//  NSSnowAnimatedLogo
//
//  Created by Matt Glover on 26/02/2014.
//  Copyright (c) 2014 Duchy Software Ltd. All rights reserved.
//

#import "NSSNOWAnimatedLogoView+Sublayers.h"

@implementation NSSNOWAnimatedLogoView (Sublayers)

- (CAShapeLayer *)outerCircleLayer {
    
    CAShapeLayer *outerCircle = [CAShapeLayer layer];
    CGFloat strokeWidth = [self strokeWidth];
    [outerCircle setBounds:CGRectInset(self.bounds, strokeWidth, strokeWidth)];
    [outerCircle setPosition:CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2)];
    [outerCircle setPath:[UIBezierPath bezierPathWithRoundedRect:outerCircle.bounds
                                                    cornerRadius:CGRectGetWidth(outerCircle.bounds)/2].CGPath];
    [outerCircle setFillColor:[UIColor clearColor].CGColor];
    [outerCircle setStrokeColor:[UIColor whiteColor].CGColor];
    [outerCircle setLineWidth:strokeWidth];
    
    return outerCircle;
}

- (CAShapeLayer *)mountainsLayer {
    
    CAShapeLayer *mountains = [CAShapeLayer layer];
    [mountains setBounds:self.bounds];
    [mountains setPosition:CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds))];
    [mountains setAnchorPoint:CGPointMake(0.5, 1.0)];
    [mountains setOpacity:0.0f];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, CGRectGetMinX(self.bounds), CGRectGetMaxY(self.bounds));
    CGPathAddLineToPoint(path, nil, (CGRectGetWidth(self.bounds)/ 8) * 0, (CGRectGetHeight(self.bounds)/ 16) * 12);
    CGPathAddLineToPoint(path, nil, (CGRectGetWidth(self.bounds)/ 8) * 2.5, (CGRectGetHeight(self.bounds)/ 16) * 7);
    CGPathAddLineToPoint(path, nil, (CGRectGetWidth(self.bounds)/ 8) * 4.5, (CGRectGetHeight(self.bounds)/ 16) * 9);
    CGPathAddLineToPoint(path, nil, (CGRectGetWidth(self.bounds)/ 8) * 8, (CGRectGetHeight(self.bounds)/ 16) * 2);
    CGPathAddLineToPoint(path, nil, CGRectGetMaxX(self.bounds), CGRectGetMaxY(self.bounds));
    CGPathCloseSubpath(path);
    
    [mountains setPath:path];
    CGPathRelease(path);
    
    [mountains setStrokeColor:[UIColor clearColor].CGColor];
    [mountains setFillColor:[UIColor whiteColor].CGColor];
    [mountains setMask:[self maskLayer]];
    
    return mountains;
}

- (CALayer *)maskLayer {
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    CGFloat strokeWidth = [self strokeWidth];
    [maskLayer setBounds:CGRectInset(self.bounds, strokeWidth, strokeWidth)];
    [maskLayer setPosition:CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2)];
    [maskLayer setPath:[UIBezierPath bezierPathWithRoundedRect:maskLayer.bounds
                                                  cornerRadius:CGRectGetWidth(maskLayer.bounds)/2].CGPath];
    [maskLayer setFillColor:[UIColor blackColor].CGColor];
    
    return maskLayer;
}

- (CGFloat)strokeWidth {
    return floorf(CGRectGetWidth(self.bounds) / 30);
}

@end
