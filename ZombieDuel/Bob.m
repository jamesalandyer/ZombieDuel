//
//  Bob.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Bob.h"

@implementation Bob

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setName:@"BOB"];
        [self setFullHP:120];
        [self setCoinValue:20];
        
        NSArray *attackNames = [NSArray arrayWithObjects:@"Punch", @"Ground Smash", @"Boulder Throw", @"Infection", nil];
        NSArray *punch = [NSArray arrayWithObjects:@"BOB JUST TRIED TO PUNCH YOU!", @"BOB JUST PUNCHED YOU!", @"BOB PUNCHED YOU WITH BOTH HANDS!", nil];
        NSArray *groundSmash = [NSArray arrayWithObjects:@"BOB SMASHED THE GROUND!", @"BOB'S GROUND SMASH SHOOK THE GROUND!", @"BOB'S GROUND SMASH HURT!", nil];
        NSArray *boulderThrow = [NSArray arrayWithObjects:@"BOB COULDN'T FIND A BOULDER!", @"BOB'S BOULDER BARELY MADE IT!", @"BOB'S BOULDER LANDED ON YOU!", nil];
        NSArray *infection = [NSArray arrayWithObjects:@"BOB'S INFECTION KILLED HIM!", @"BOB'S INFECTION MIGHT SPREAD TO YOU!", @"BOB'S INFECTION DIDN'T HOLD", nil];
        
        NSDictionary *attacks = [NSDictionary dictionaryWithObjectsAndKeys:punch, @"Punch", groundSmash , @"Ground Smash", boulderThrow, @"Boulder Throw", infection, @"Infection", nil];
        NSDictionary *attacksDamage = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:20], @"Chase", [NSNumber numberWithInt:10], @"Eye Throw", [NSNumber numberWithInt:15], @"Kick", [NSNumber numberWithInt:10], @"Infection", nil];
        
        [self setAttack:[[Attack alloc]initWithAttacks:attacks withDamage:attacksDamage withAttackNames:attackNames]];
        [self setDefense:[[Defense alloc]initWithHP:[self fullHP]]];
        [self setDeadImageNumber:5];
    }
    
    return self;
}

@end
