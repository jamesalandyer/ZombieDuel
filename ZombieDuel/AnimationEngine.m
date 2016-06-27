//
//  AnimationEngine.m
//  ZombieDuel
//
//  Created by James Dyer on 6/26/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "AnimationEngine.h"
#import <pop/POP.h>

@interface AnimationEngine ()
@property (nonatomic) CGPoint offScreenRightPosition;
@property (nonatomic) CGPoint offScreenLeftPosition;
@property (nonatomic) CGFloat originalConstant;
@property (nonatomic) NSLayoutConstraint *contraint;
@property (nonatomic) AVAudioPlayer *sfxTitle;
@end

@implementation AnimationEngine

- (instancetype)initRightSideWithConstraint: (NSLayoutConstraint*)con {
    [self createSound];
    
    _offScreenRightPosition = CGPointMake([UIScreen mainScreen].bounds.size.width, CGRectGetMidY([UIScreen mainScreen].bounds));
    
    _originalConstant = con.constant;
    con.constant = _offScreenRightPosition.x;
    _contraint = con;
    
    return self;
}

- (instancetype)initLeftSideWithConstraint: (NSLayoutConstraint*)con {
    [self createSound];
    
    _offScreenLeftPosition = CGPointMake([UIScreen mainScreen].bounds.size.width, CGRectGetMidY([UIScreen mainScreen].bounds));
    
    _originalConstant = con.constant;
    con.constant = _offScreenLeftPosition.x;
    _contraint = con;
    
    return self;
}

- (void)animateOnScreen {
    [self playTitleSound];
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)((double)0.75 * (double)NSEC_PER_SEC));
    dispatch_after(time, dispatch_get_main_queue(), ^{
        POPSpringAnimation *moveAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayoutConstraintConstant];
        moveAnim.toValue = @([self originalConstant]);
        moveAnim.springBounciness = 5.0f;
        moveAnim.springSpeed = 5.0f;
        
        [[self contraint] pop_addAnimation:moveAnim forKey:@"moveOnScreen"];
    });
}

- (void)createSound {
    @try {
        _sfxTitle = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"title" ofType:@"wav"]] error:nil];
        [_sfxTitle prepareToPlay];
    }
    
    @catch (NSException *exception){
        NSLog(@"%@", exception.debugDescription);
    }
}
- (void)playTitleSound {
    if (_sfxTitle.playing)
        [_sfxTitle stop];
    [_sfxTitle play];
}

@end
