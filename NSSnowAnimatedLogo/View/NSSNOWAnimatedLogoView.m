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
#import "NSSNOWYearOvalLayer.h"

static NSTimeInterval kDefaultSlowAnimationDuration = 3.0;
static NSTimeInterval kDefaultStandardAnimationDuration = 1.5;
static NSTimeInterval kDefaultFastAnimationDuration = 1.0;

@interface NSSNOWAnimatedLogoView ()
@property (nonatomic, strong) CAShapeLayer *outerCircle;
@property (nonatomic, strong) CAShapeLayer *mountains;
@property (nonatomic, strong) CAShapeLayer *skiTracks;
@property (nonatomic, strong) NSSNOWYearOvalLayer *yearOval;
@property (nonatomic, strong) CATextLayer *nssnowText;
@end

@implementation NSSNOWAnimatedLogoView

- (id)initWithFrame:(CGRect)frame {
    
    // Make sure it is square.
    CGRect squareRect = [self squareFrameFromOriginalFrame:frame];
    if (self = [super initWithFrame:squareRect]) {
        
        [self setupBackground];
        
        [self setupLayers];
        
        double delayInSeconds = 0.5;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self addSublayers];
            [self animateCircle:YES];
        });
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

    self.yearOval = [self yearOvalLayer];
    [self.yearOval setYearString:@"2014"];
    [self.yearOval setZPosition:CGFLOAT_MAX];
    [self transformYearOval];
    
    self.outerCircle = [self outerCircleLayer];
    self.mountains = [self mountainsLayer];
    self.skiTracks = [self skiTracksLayer];
    self.nssnowText = [self nssnowTextLayer];
}

- (void)addSublayers {
    
    [self.layer addSublayer:self.mountains];
    [self.layer addSublayer:self.outerCircle];
    [self.layer addSublayer:self.yearOval];
    [self.layer addSublayer:self.nssnowText];
}

- (void)animateCircle:(BOOL)animated {
    
    NSTimeInterval animationDuration = animated ? kDefaultFastAnimationDuration : 0.0f;
    CABasicAnimation *outerCircleAnimation = [self outerCircleStrokeAnimationWithDuration:animationDuration];
    [self.outerCircle addAnimation:outerCircleAnimation forKey:nil];
}

- (void)animateMountains:(BOOL)animated {
    
    NSTimeInterval animationDuration = animated ? kDefaultStandardAnimationDuration : 0.0;
    CABasicAnimation *mountainAnimation = [self mountainAnimationWithMountainsLayer:self.mountains
                                                                           duration:animationDuration];
    [self.mountains addAnimation:mountainAnimation forKey:nil];
}

- (void)animateExpandYearOval:(BOOL)animated {
    
    NSTimeInterval animationDuration = animated ? kDefaultFastAnimationDuration : 0.0;
    CABasicAnimation *mountainAnimation = [self yearOvalTransformAnimationWithLayer:self.yearOval
                                                                           duration:animationDuration];
    [self.yearOval addAnimation:mountainAnimation forKey:nil];
}

- (void)animateNSSnowText:(BOOL)animated {
    
    NSTimeInterval animationDuration = animated ? kDefaultFastAnimationDuration : 0.0;
    CABasicAnimation *nssnowAnimation = [self nssnowTextAnimationWithTextLayer:self.nssnowText
                                                                      duration:animationDuration];
    [self.nssnowText addAnimation:nssnowAnimation forKey:nil];
}

- (void)animateSkiTracks:(BOOL)animated {
    
    [self.layer addSublayer:self.skiTracks];
    
    NSTimeInterval animationDuration = animated ? kDefaultSlowAnimationDuration : 0.0;
    CABasicAnimation *skiTracksAnimation = [self skiTracksStrokeAnimationWithDuration:animationDuration];
    [self.skiTracks addAnimation:skiTracksAnimation forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    if([[anim valueForKey:NSSnowAnimatedLogoViewAnimationKeyID] isEqualToString:NSSNOWAnimatedLogoViewAnimationIDCircleStroke]){
        [self animateMountains:YES];
        [self animateExpandYearOval:YES];
        [self animateNSSnowText:YES];
        [self.yearOval displayYearStringWithAnimationDuration:kDefaultFastAnimationDuration];
    }
    
    if([[anim valueForKey:NSSnowAnimatedLogoViewAnimationKeyID] isEqualToString:NSSNOWAnimatedLogoViewAnimationIDMountainOpacity]){
        [self animateSkiTracks:YES];
    }
}

- (void)transformYearOval {
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0f / 500.0f;
    transform = CATransform3DScale(transform, 1.0, 0.0, 1.0);
    transform = CATransform3DRotate(transform, (90 * M_PI / 180), 1.0, 0.0, 0.0);
    [self.yearOval setTransform:transform];
}

@end
