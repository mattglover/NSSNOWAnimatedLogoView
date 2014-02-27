//
//  NSSNOWYearOvalLayer.m
//  NSSnowAnimatedLogo
//
//  Created by Matt Glover on 26/02/2014.
//  Copyright (c) 2014 Duchy Software Ltd. All rights reserved.
//

#import "NSSNOWYearOvalLayer.h"

@interface NSSNOWYearOvalLayer ()
@property (nonatomic, strong) CATextLayer *yearStringTextLayer;
@end

@implementation NSSNOWYearOvalLayer

- (void)setYearString:(NSString *)yearString {
    
    if (self.yearStringTextLayer) {
        [self.yearStringTextLayer removeFromSuperlayer];
        self.yearStringTextLayer = nil;
    }
    
    self.yearStringTextLayer = [CATextLayer layer];
    CGFloat yearStringYOffset = ([self fontSize] * 0.2); // sorts out V alignment issues
    [self.yearStringTextLayer setBounds:CGRectMake(0, 0, CGRectGetWidth(self.bounds), [self fontSize] + yearStringYOffset)];
    [self.yearStringTextLayer setPosition:CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2)];
    [self.yearStringTextLayer setFont:(__bridge CFTypeRef)([UIFont boldSystemFontOfSize:18].fontName)];
    [self.yearStringTextLayer setFontSize:[self fontSize]];
    [self.yearStringTextLayer setAlignmentMode:kCAAlignmentCenter];
    [self.yearStringTextLayer setString:yearString];
    [self.yearStringTextLayer setOpacity:0.0f];
    [self.yearStringTextLayer setContentsScale:[UIScreen mainScreen].scale];
    
    [self addSublayer:self.yearStringTextLayer];
}

- (void)displayYearStringWithAnimationDuration:(NSTimeInterval)animationDuration {
    
    CGFloat originOpacity = self.yearStringTextLayer.opacity;
    CGFloat destinationOpacity = 1.0f;
    
    self.yearStringTextLayer.opacity = destinationOpacity;
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [opacityAnimation setDuration:animationDuration];
    [opacityAnimation setFromValue:@(originOpacity)];
    [opacityAnimation setToValue:@(destinationOpacity)];
    
    [self.yearStringTextLayer addAnimation:opacityAnimation forKey:nil];
}

#pragma mark - Font Size Helper
- (CGFloat)fontSize {
    CGFloat fontSize = floorf(CGRectGetHeight(self.bounds) / 1.7);
    return fontSize;
}

@end
