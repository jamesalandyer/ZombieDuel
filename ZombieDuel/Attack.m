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
@property (nonatomic) NSArray *attackNames;
@end

@implementation Attack

- (instancetype)initWithAttacks: (NSDictionary*)attacks withDamage: (NSDictionary*)damage withAttackNames: (NSArray*)attackNames {
    self = [super init];
    
    if (self) {
        [self setAttacks:attacks];
        [self setDamage:damage];
        [self setAttackNames:attackNames];;
    }
    
    return self;
}

/**
 * Randomly selects the attack's message and damage amount based on the attack.
 *
 * @param attack The attack to be used.
 *
 * @return A dictionary of the attacks message with the attacks damage.
 */
- (NSMutableDictionary*)attackWithAttack: (NSNumber*)attack {
    int rand = arc4random_uniform(18);
    NSString *attackName = (NSString*)[_attackNames objectAtIndex:attack.intValue];
    NSArray *attackMessages = (NSArray*)[_attacks objectForKey:attackName];
    NSNumber *damageAmount = (NSNumber*)[_damage objectForKey:attackName];
    NSNumber *attackDamage = damageAmount;
    NSMutableDictionary *attackResult = [[NSMutableDictionary alloc]init];
    if (attack.integerValue == 0) {
        if (rand >= 14) {
            [attackResult setObject:attackDamage forKey:(NSString*)[attackMessages objectAtIndex:2]];
            return attackResult;
        } else if (rand > 5) {
            [attackResult setObject:[NSNumber numberWithDouble:ceil(attackDamage.doubleValue / 2)] forKey:(NSString*)[attackMessages objectAtIndex:1]];
            return attackResult;
        } else if (rand <= 5) {
            [attackResult setObject:[NSNumber numberWithInt:0] forKey:(NSString*)[attackMessages objectAtIndex:0]];
            return attackResult;
        }
    } else if (attack.integerValue == 1) {
        if (rand >= 10) {
            [attackResult setObject:attackDamage forKey:(NSString*)[attackMessages objectAtIndex:2]];
            return attackResult;
        } else if (rand > 4) {
            [attackResult setObject:[NSNumber numberWithDouble:ceil(attackDamage.doubleValue / 2)] forKey:(NSString*)[attackMessages objectAtIndex:1]];
            return attackResult;
        } else if (rand <= 4) {
            [attackResult setObject:[NSNumber numberWithInt:0] forKey:(NSString*)[attackMessages objectAtIndex:0]];
            return attackResult;
        }
    } else if (attack.integerValue == 2) {
        if (rand >= 12) {
            [attackResult setObject:attackDamage forKey:(NSString*)[attackMessages objectAtIndex:2]];
            return attackResult;
        } else if (rand > 4) {
            [attackResult setObject:[NSNumber numberWithDouble:ceil(attackDamage.doubleValue / 2)] forKey:(NSString*)[attackMessages objectAtIndex:1]];
            return attackResult;
        } else if (rand <= 4) {
            [attackResult setObject:[NSNumber numberWithInt:0] forKey:(NSString*)[attackMessages objectAtIndex:0]];
            return attackResult;
        }
    } else if (attack.integerValue == 3) {
        if (rand > 15) {
            [attackResult setObject:[NSNumber numberWithInteger:(attackDamage.integerValue + 30)] forKey:(NSString*)[attackMessages objectAtIndex:2]];
            return attackResult;
        } else if (rand > 3) {
            [attackResult setObject:[NSNumber numberWithDouble:ceil(attackDamage.doubleValue / 2)] forKey:(NSString*)[attackMessages objectAtIndex:1]];
            return attackResult;
        } else if (rand <= 3) {
            [attackResult setObject:[NSNumber numberWithInt:1000] forKey:(NSString*)[attackMessages objectAtIndex:0]];
            return attackResult;
        }
    }
    
    return attackResult;
}

@end
