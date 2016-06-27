//
//  AnimationEngine.h
//  ZombieDuel
//
//  Created by James Dyer on 6/26/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AnimationEngine : NSObject
- (instancetype)initRightSideWithConstraint: (NSLayoutConstraint*)con;
- (instancetype)initLeftSideWithConstraint: (NSLayoutConstraint*)con;
- (void)animateOnScreen;
@end
