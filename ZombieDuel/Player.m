//
//  Player.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Player.h"

@implementation Player

/**
 * Increases the player's health and resets their defense to the new amount.
 *
 * @param amount The amount to add to the player's health.
 */
- (void)increaseHP: (NSInteger)amount {
    [self setFullHP:([self fullHP] + amount)];
    [[self defense] resetHP:[self fullHP]];
}

/**
 * Increases the player's damage.
 *
 * @param amount The amount to add to the player's damage.
 */
- (void)increaseDamage: (NSInteger)amount {
    [self setExtraDamage: (_extraDamage + amount)];
}

@end
