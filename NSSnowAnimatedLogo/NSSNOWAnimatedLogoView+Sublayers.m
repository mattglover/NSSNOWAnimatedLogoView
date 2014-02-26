//
//  NSSNOWAnimatedLogoView+Sublayers.m
//  NSSnowAnimatedLogo
//
//  Created by Matt Glover on 26/02/2014.
//  Copyright (c) 2014 Duchy Software Ltd. All rights reserved.
//

#import "NSSNOWAnimatedLogoView+Sublayers.h"
#import "NSSNOWYearOvalLayer.h"

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

- (NSSNOWYearOvalLayer *)yearOvalLayer {
    
    NSSNOWYearOvalLayer *yearOval = [NSSNOWYearOvalLayer layer];
    CGFloat strokeWidth = [self strokeWidth];
    [yearOval setBounds:CGRectMake(0, 0, CGRectGetWidth(self.bounds)/3, CGRectGetHeight(self.bounds)/6)];
    [yearOval setPosition:CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(yearOval.bounds)/2 - strokeWidth)];
    [yearOval setPath:[UIBezierPath bezierPathWithRoundedRect:yearOval.bounds
                                                    cornerRadius:CGRectGetWidth(yearOval.bounds)/2].CGPath];
    [yearOval setFillColor:[UIColor blackColor].CGColor];
    [yearOval setStrokeColor:[UIColor whiteColor].CGColor];
    [yearOval setLineWidth:strokeWidth/2];
    
    return yearOval;
}

- (CATextLayer *)nssnowTextLayer {
    
    CATextLayer *nssnowTextLayer = [CATextLayer layer];
    [nssnowTextLayer setBounds:CGRectMake(0, 0, CGRectGetWidth(self.bounds)/2, [self fontSize])];
    [nssnowTextLayer setPosition:CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/3.5)];
    [nssnowTextLayer setFont:(__bridge CFTypeRef)([UIFont boldSystemFontOfSize:18].fontName)];
    [nssnowTextLayer setFontSize:[self fontSize]];
    [nssnowTextLayer setAlignmentMode:kCAAlignmentCenter];
    [nssnowTextLayer setString:@"NSSNOW"];
    [nssnowTextLayer setOpacity:0.0f];
    [nssnowTextLayer setContentsScale:[UIScreen mainScreen].scale];
    
    return nssnowTextLayer;
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

- (void)maskOuterCircle:(CAShapeLayer *)outerCircleLayer withMaskLayer:(CAShapeLayer *)maskLayer {
    [outerCircleLayer setMask:maskLayer];
}

#pragma mark - Stroke Width Helper
- (CGFloat)strokeWidth {
    return floorf(CGRectGetWidth(self.bounds) / 30);
}

#pragma mark - Font Size Helper
- (CGFloat)fontSize {
    CGFloat fontSize = floorf(CGRectGetHeight(self.bounds) * 0.1);
    return fontSize;
}

@end
