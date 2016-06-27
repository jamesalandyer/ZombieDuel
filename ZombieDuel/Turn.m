//
//  Turn.m
//  ZombieDuel
//
//  Created by James Dyer on 6/24/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Turn.h"
#import "Player.h"
#import "Enemy.h"
#import "Hunter.h"
#import "Hank.h"
#import "Jack.h"
#import "Melissa.h"
#import "Timmy.h"
#import "Johnny.h"
#import "Kip.h"
#import "Sally.h"
#import "Bob.h"
#import "Carl.h"

@implementation Turn

- (NSString*)playerTurnWithPlayer: (Player*)player withAttack: (NSNumber*)attack withEnemy: (Enemy*)enemy {
    
    if ((Hunter*)player) {
        Hunter *currentPlayer = (Hunter*)player;
        NSMutableDictionary *playerAttack = [[currentPlayer attack] attackWithAttack:attack];
        NSNumber *damageAmount = (NSNumber*)[[playerAttack allValues] objectAtIndex:0];
        NSNumber *adjustedDamageAmount = [NSNumber numberWithInteger:(damageAmount.integerValue + [player extraDamage])];
        if (damageAmount.integerValue == 1000)
            [[player defense] inflictDamage:damageAmount.integerValue];
        else if (damageAmount.integerValue > 0)
            [[enemy defense] inflictDamage:adjustedDamageAmount.integerValue];
        return (NSString*)[[playerAttack allKeys] objectAtIndex:0];
    } else if ((Hank*)player) {
        Hank *currentPlayer = (Hank*)player;
        NSMutableDictionary *playerAttack = [[currentPlayer attack] attackWithAttack:attack];
        NSNumber *damageAmount = (NSNumber*)[[playerAttack allValues] objectAtIndex:0];
        NSNumber *adjustedDamageAmount = [NSNumber numberWithInteger:(damageAmount.integerValue + [player extraDamage])];
        if (damageAmount.integerValue == 1000)
            [[player defense] inflictDamage:damageAmount.integerValue];
        else if (damageAmount.integerValue > 0)
            [[enemy defense] inflictDamage:adjustedDamageAmount.integerValue];
        return (NSString*)[[playerAttack allKeys] objectAtIndex:0];
    }
    
    return nil;
}

- (NSString*)enemyTurnWithEnemy: (Enemy*)enemy withPlayer: (Player*)player withMultiplier: (NSInteger)number {
    int rand = (arc4random_uniform(4));
    
    if ((Jack*)enemy) {
        Jack *currentEnemy = (Jack*)enemy;
        NSMutableDictionary *enemyAttack = [[currentEnemy attack] attackWithAttack:[NSNumber numberWithInt:rand]];
        NSNumber *damageAmount = (NSNumber*)[[enemyAttack allValues] objectAtIndex:0];
        NSNumber *adjustedDamageAmount = [NSNumber numberWithInteger:(damageAmount.integerValue * number)];
        if (damageAmount.integerValue == 1000)
            [[enemy defense] inflictDamage:damageAmount.integerValue];
        else
            [[player defense] inflictDamage:adjustedDamageAmount.integerValue];
        return (NSString*)[[enemyAttack allKeys] objectAtIndex:0];
    } else if ((Melissa*)enemy) {
        Melissa *currentEnemy = (Melissa*)enemy;
        NSMutableDictionary *enemyAttack = [[currentEnemy attack] attackWithAttack:[NSNumber numberWithInt:rand]];
        NSNumber *damageAmount = (NSNumber*)[[enemyAttack allValues] objectAtIndex:0];
        NSNumber *adjustedDamageAmount = [NSNumber numberWithInteger:(damageAmount.integerValue * number)];
        if (damageAmount.integerValue == 1000)
            [[enemy defense] inflictDamage:damageAmount.integerValue];
        else
            [[player defense] inflictDamage:adjustedDamageAmount.integerValue];
        return (NSString*)[[enemyAttack allKeys] objectAtIndex:0];
    } else if ((Timmy*)enemy) {
        Timmy *currentEnemy = (Timmy*)enemy;
        NSMutableDictionary *enemyAttack = [[currentEnemy attack] attackWithAttack:[NSNumber numberWithInt:rand]];
        NSNumber *damageAmount = (NSNumber*)[[enemyAttack allValues] objectAtIndex:0];
        NSNumber *adjustedDamageAmount = [NSNumber numberWithInteger:(damageAmount.integerValue * number)];
        if (damageAmount.integerValue == 1000)
            [[enemy defense] inflictDamage:damageAmount.integerValue];
        else
            [[player defense] inflictDamage:adjustedDamageAmount.integerValue];
        return (NSString*)[[enemyAttack allKeys] objectAtIndex:0];
    } else if ((Johnny*)enemy) {
        Johnny *currentEnemy = (Johnny*)enemy;
        NSMutableDictionary *enemyAttack = [[currentEnemy attack] attackWithAttack:[NSNumber numberWithInt:rand]];
        NSNumber *damageAmount = (NSNumber*)[[enemyAttack allValues] objectAtIndex:0];
        NSNumber *adjustedDamageAmount = [NSNumber numberWithInteger:(damageAmount.integerValue * number)];
        if (damageAmount.integerValue == 1000)
            [[enemy defense] inflictDamage:damageAmount.integerValue];
        else
            [[player defense] inflictDamage:adjustedDamageAmount.integerValue];
        return (NSString*)[[enemyAttack allKeys] objectAtIndex:0];
    } else if ((Kip*)enemy) {
        Kip *currentEnemy = (Kip*)enemy;
        NSMutableDictionary *enemyAttack = [[currentEnemy attack] attackWithAttack:[NSNumber numberWithInt:rand]];
        NSNumber *damageAmount = (NSNumber*)[[enemyAttack allValues] objectAtIndex:0];
        NSNumber *adjustedDamageAmount = [NSNumber numberWithInteger:(damageAmount.integerValue * number)];
        if (damageAmount.integerValue == 1000)
            [[enemy defense] inflictDamage:damageAmount.integerValue];
        else
            [[player defense] inflictDamage:adjustedDamageAmount.integerValue];
        return (NSString*)[[enemyAttack allKeys] objectAtIndex:0];
    } else if ((Sally*)enemy) {
        Sally *currentEnemy = (Sally*)enemy;
        NSMutableDictionary *enemyAttack = [[currentEnemy attack] attackWithAttack:[NSNumber numberWithInt:rand]];
        NSNumber *damageAmount = (NSNumber*)[[enemyAttack allValues] objectAtIndex:0];
        NSNumber *adjustedDamageAmount = [NSNumber numberWithInteger:(damageAmount.integerValue * number)];
        if (damageAmount.integerValue == 1000)
            [[enemy defense] inflictDamage:damageAmount.integerValue];
        else
            [[player defense] inflictDamage:adjustedDamageAmount.integerValue];
        return (NSString*)[[enemyAttack allKeys] objectAtIndex:0];
    } else if ((Bob*)enemy) {
        Bob *currentEnemy = (Bob*)enemy;
        NSMutableDictionary *enemyAttack = [[currentEnemy attack] attackWithAttack:[NSNumber numberWithInt:rand]];
        NSNumber *damageAmount = (NSNumber*)[[enemyAttack allValues] objectAtIndex:0];
        NSNumber *adjustedDamageAmount = [NSNumber numberWithInteger:(damageAmount.integerValue * number)];
        if (damageAmount.integerValue == 1000)
            [[enemy defense] inflictDamage:damageAmount.integerValue];
        else
            [[player defense] inflictDamage:adjustedDamageAmount.integerValue];
        return (NSString*)[[enemyAttack allKeys] objectAtIndex:0];
    } else if ((Carl*)enemy) {
        Carl *currentEnemy = (Carl*)enemy;
        NSMutableDictionary *enemyAttack = [[currentEnemy attack] attackWithAttack:[NSNumber numberWithInt:rand]];
        NSNumber *damageAmount = (NSNumber*)[[enemyAttack allValues] objectAtIndex:0];
        NSNumber *adjustedDamageAmount = [NSNumber numberWithInteger:(damageAmount.integerValue * number)];
        if (damageAmount.integerValue == 1000)
            [[enemy defense] inflictDamage:damageAmount.integerValue];
        else
            [[player defense] inflictDamage:adjustedDamageAmount.integerValue];
        return (NSString*)[[enemyAttack allKeys] objectAtIndex:0];
    }
    
    return nil;
}

@end
