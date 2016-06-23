//
//  CustomAnimatedButton.m
//  ZombieDuel
//
//  Created by James Dyer on 6/23/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "CustomAnimatedButton.h"

@implementation CustomAnimatedButton

-(void) imageAnimationWithName:(NSString* _Nonnull)name withState:(NSString* _Nonnull)state withImageNumber:(int)imageNumber {
    
    if ([state isEqual: @"idle"])
        [[self imageView] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@%@1.png", name, state]]];
    else
        [[self imageView] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@%@%d.png", name, state, imageNumber]]];
    
    [[self imageView] setAnimationImages:nil];
    
    NSMutableArray *imgArray = [[NSMutableArray alloc]init];
    
    for (int i = 1; i <= imageNumber; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@%d", name, state, i]];
        [imgArray addObject:img];
    }
    
    [[self imageView] setAnimationImages:imgArray];
    [[self imageView] setAnimationDuration:0.8];
    if ([state isEqualToString:@"dead"]) {
        [[self imageView] setAnimationRepeatCount:1];
        [[self imageView] startAnimating];
    } else {
        [[self imageView] setAnimationRepeatCount:0];
        [[self imageView] startAnimating];
    }
        
}

@end
