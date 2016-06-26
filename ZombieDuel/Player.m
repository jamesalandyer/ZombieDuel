//
//  Player.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Player.h"

@implementation Player

- (void)increaseHP: (NSInteger)amount {
    [self setFullHP:([self fullHP] + amount)];
    [[self defense] resetHP:[self fullHP]];
}

- (void)increaseDamage: (NSInteger)amount {
    [self setExtraDamage: (_extraDamage + amount)];
}

@end
