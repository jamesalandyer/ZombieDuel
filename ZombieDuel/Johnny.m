//
//  Johnny.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Johnny.h"

@implementation Johnny

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setName:@"JOHNNY"];
        [self setFullHP:100];
        [self setCoinValue:9];
        
        NSArray *attackNames = [NSArray arrayWithObjects:@"Rock Throw", @"Karate Chop", @"Smother", @"Infection", nil];
        NSArray *rockThrow = [NSArray arrayWithObjects:@"JOHNNY SUCKS AT THROWING ROCKS!", @"JOHNNY HIT YOU WITH A ROCK", @"JOHNNY CAN THROW THE ROCK!", nil];
        NSArray *karateChop = [NSArray arrayWithObjects:@"JOHNNY'S KARATE CHOP MISSED!", @"JOHNNY'S KARATE CHOP HIT YOU!", @"JOHNNY'S KARATE CHOP WAS PERFECT!", nil];
        NSArray *smother = [NSArray arrayWithObjects:@"JOHNNY TRIED TO SMOTHER YOU!", @"JOHNNY ALMOST SMOTHERED YOU!", @"JOHNNY REALLY SMOTHERED YOU!", nil];
        NSArray *infection = [NSArray arrayWithObjects:@"JOHNNY'S INFECTION KILLED HIM!", @"JOHNNY'S INFECTION MIGHT SPREAD TO YOU!", @"JOHNNY'S INFECTION DIDN'T HOLD", nil];
        
        NSDictionary *attacks = [NSDictionary dictionaryWithObjectsAndKeys:rockThrow, @"Rock Throw", karateChop, @"Karate Chop", smother, @"Smother", infection, @"Infection", nil];
        NSDictionary *attacksDamage = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:20], @"Rock Throw", [NSNumber numberWithInt:10], @"Karate Chop", [NSNumber numberWithInt:15], @"Smother", [NSNumber numberWithInt:10], @"Infection", nil];
        
        [self setAttack:[[Attack alloc]initWithAttacks:attacks withDamage:attacksDamage withAttackNames:attackNames]];
        [self setDefense:[[Defense alloc]initWithHP:[self fullHP]]];
        [self setDeadImageNumber:5];
    }
    
    return self;
}

@end
