//
//  NSSNOWAppDelegate.m
//  NSSnowAnimatedLogo
//
//  Created by Matt Glover on 23/02/2014.
//  Copyright (c) 2014 Duchy Software Ltd. All rights reserved.
//

#import "NSSNOWAppDelegate.h"
#import "NSSNOWAnimatedLogoView.h"

@implementation NSSNOWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor blackColor];
    
    NSSNOWAnimatedLogoView *logoViewSmall = [[NSSNOWAnimatedLogoView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [logoViewSmall setCenter:CGPointMake(CGRectGetWidth(self.window.bounds)/5, CGRectGetHeight(self.window.bounds)/5)];
    [self.window addSubview:logoViewSmall];
    
    NSSNOWAnimatedLogoView *logoView = [[NSSNOWAnimatedLogoView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [logoView setCenter:CGPointMake(CGRectGetWidth(self.window.bounds)/2, CGRectGetHeight(self.window.bounds)/2)];
    [self.window addSubview:logoView];
    
    NSSNOWAnimatedLogoView *logoViewReallySmall = [[NSSNOWAnimatedLogoView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [logoViewReallySmall setCenter:CGPointMake((CGRectGetWidth(self.window.bounds)/5) * 4, (CGRectGetHeight(self.window.bounds)/5) * 3.5)];
    [self.window addSubview:logoViewReallySmall];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
