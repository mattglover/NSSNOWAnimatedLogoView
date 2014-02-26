//
//  NSSNOWAnimatedLogoView.m
//  NSSnowAnimatedLogo
//
//  Created by Matt Glover on 23/02/2014.
//  Copyright (c) 2014 Duchy Software Ltd. All rights reserved.
//

#import "NSSNOWAnimatedLogoView.h"
#import "NSSNOWAnimatedLogoView+Animations.h"
#import "NSSNOWAnimatedLogoView+Sublayers.h"

static NSTimeInterval kDefaultAnimationDuration = 1.0;

@interface NSSNOWAnimatedLogoView ()

@property (nonatomic, strong) CAShapeLayer *outerCircle;
@property (nonatomic, strong) CAShapeLayer *mountains;
@end

@implementation NSSNOWAnimatedLogoView

- (id)initWithFrame:(CGRect)frame {
    
    // Make sure it is square.
    CGRect squareRect = [self squareFrameFromOriginalFrame:frame];
    if (self = [super initWithFrame:squareRect]) {
        
        [self setupBackground];
        
        [self setupLayers];
        [self addSublayers];
        
        [self animateCircle:YES];
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

- (void)setupLayers {

    self.outerCircle = [self outerCircleLayer];
    
    self.mountains = [self mountainsLayer];
    [self.mountains setTransform:CATransform3DMakeScale(1.0, 0.0, 1.0)];
}

- (void)addSublayers {
    
    [self.layer addSublayer:self.mountains];
    [self.layer addSublayer:self.outerCircle];
}

- (void)animateCircle:(BOOL)animated {
    
    NSTimeInterval animationDuration = animated ? kDefaultAnimationDuration : 0.0f;
    CABasicAnimation *outerCircleAnimation = [self outerCircleAnimation:animationDuration];
    [self.outerCircle addAnimation:outerCircleAnimation forKey:@"circleStrokeEndAnimation"];
}

- (void)animateMountains:(BOOL)animated {
    
    NSTimeInterval animationDuration = animated ? kDefaultAnimationDuration : 0.0;
    CABasicAnimation *mountainAnimation = [self mountainAnimationWithMountainsLayer:self.mountains
                                                                           duration:animationDuration];
    [self.mountains addAnimation:mountainAnimation forKey:@"mountainsTransformAnimation"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    if([[anim valueForKey:@"id"] isEqualToString:@"circleStrokeEndAnimation"]){
        [self animateMountains:YES];
    }
    
    if([[anim valueForKey:@"id"] isEqualToString:@"mountainsTransformAnimation"]){
        
    }
}

@end
