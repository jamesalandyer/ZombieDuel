//
//  CharacterAnimationImageView.m
//  ZombieDuel
//
//  Created by James Dyer on 6/24/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "CharacterAnimationImageView.h"

@implementation CharacterAnimationImageView

- (void)imageAnimationWithName:(NSString* _Nonnull)name withState:(NSString* _Nonnull)state withImageNumber:(int)imageNumber {
    
    if ([state isEqual: @"idle"])
        [self setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@%@1.png", name, state]]];
    else
        [self setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@%@%d.png", name, state, imageNumber]]];
    
    [self setAnimationImages:nil];
    
    NSMutableArray *imgArray = [[NSMutableArray alloc]init];
    
    for (int i = 1; i <= imageNumber; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@%d.png", name, state, i]];
        [imgArray addObject:img];
    }
    
    [self setAnimationImages:imgArray];
    [self setAnimationDuration:1.2];
    if ([state isEqualToString:@"dead"]) {
        [self setAnimationRepeatCount:1];
        [self startAnimating];
    } else {
        [self setAnimationRepeatCount:0];
        [self startAnimating];
    }
    
}

@end
