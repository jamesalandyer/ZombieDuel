//
//  Attack.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Attack.h"

@interface Attack ()
@property (nonatomic) NSDictionary *attacks;
@property (nonatomic) NSDictionary *damage;
@end

@implementation Attack

- (instancetype)initWithAttacks: (NSDictionary*)attacks withDamage: (NSDictionary*)damage {
    self = [super init];
    
    if (self) {
        [self setAttacks:attacks];
        [self setDamage:damage];
    }
    
    return self;
}

- (NSMutableDictionary*)attackWithAttack: (NSNumber*)attack {
    int rand = arc4random_uniform(18);
    NSArray *allAttackNames = [[self attacks] allKeys];
    NSString *attackName = [allAttackNames objectAtIndex:(NSUInteger)attack];
    NSArray *attackMessages = (NSArray*)[[self damage] objectForKey:attackName];
    NSNumber *attackDamage = (NSNumber*)[[self damage] objectForKey:attackName];
    NSMutableDictionary *attackResult = [[NSMutableDictionary alloc]init];
    
    if ([attack isEqualToNumber:[NSNumber numberWithInteger:1]]) {
        if (rand >= 14) {
            [attackResult setObject:attackDamage forKey:[attackMessages objectAtIndex:2]];
            return attackResult;
        } else if (rand > 8) {
            [attackResult setObject:@(ceil(attackDamage.doubleValue / 2)) forKey:[attackMessages objectAtIndex:1]];
            return attackResult;
        } else if (rand <= 8) {
            [attackResult setObject:[NSNumber numberWithInt:0] forKey:[attackMessages objectAtIndex:0]];
            return attackResult;
        }
    } else if ([attack isEqualToNumber:[NSNumber numberWithInteger:2]]) {
        if (rand >= 10) {
            [attackResult setObject:attackDamage forKey:[attackMessages objectAtIndex:2]];
            return attackResult;
        } else if (rand > 4) {
            [attackResult setObject:@(ceil(attackDamage.doubleValue / 2)) forKey:[attackMessages objectAtIndex:1]];
            return attackResult;
        } else if (rand <= 4) {
            [attackResult setObject:[NSNumber numberWithInt:0] forKey:[attackMessages objectAtIndex:0]];
            return attackResult;
        }
    } else if ([attack isEqualToNumber:[NSNumber numberWithInteger:3]]) {
        if (rand >= 12) {
            [attackResult setObject:attackDamage forKey:[attackMessages objectAtIndex:2]];
            return attackResult;
        } else if (rand > 6) {
            [attackResult setObject:@(ceil(attackDamage.doubleValue / 2)) forKey:[attackMessages objectAtIndex:1]];
            return attackResult;
        } else if (rand <= 6) {
            [attackResult setObject:[NSNumber numberWithInt:0] forKey:[attackMessages objectAtIndex:0]];
            return attackResult;
        }
    } else if ([attack isEqualToNumber:[NSNumber numberWithInteger:4]]) {
        if (rand >= 16) {
            [attackResult setObject:attackDamage forKey:[attackMessages objectAtIndex:2]];
            return attackResult;
        } else if (rand > 8) {
            [attackResult setObject:@(ceil(attackDamage.doubleValue / 2)) forKey:[attackMessages objectAtIndex:1]];
            return attackResult;
        } else if (rand <= 8) {
            [attackResult setObject:[NSNumber numberWithInt:1000] forKey:[attackMessages objectAtIndex:0]];
            return attackResult;
        }
    }
    
    return attackResult;
}

@end
