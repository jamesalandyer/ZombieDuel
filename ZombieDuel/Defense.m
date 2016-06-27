//
//  Defense.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Defense.h"

@implementation Defense

- (instancetype)initWithHP: (NSInteger)hp {
    self = [super init];
    
    if (self)
        [self setCurrentHP:hp];
    
    return self;
}

/**
 * Sets the HP of the character.
 *
 * @param fullHP The HP of the character.
 */
- (void)resetHP: (NSInteger)fullHP {
    [self setCurrentHP:fullHP];
}

/**
 * Changes the HP to show what the current HP is.
 *
 * @param damage The damage amount done to the character.
 */
- (void)inflictDamage: (NSInteger)damage {
    [self setCurrentHP:(_currentHP - damage)];
}

@end
