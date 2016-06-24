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
        [self setFullHP:(NSInteger)100];
        [self setCoinValue:(NSInteger)9];
        
        NSArray *rockThrow = [NSArray arrayWithObjects:@"JOHNNY SUCKS AT THROWING ROCKS!", @"JOHNNY HIT YOU WITH A ROCK", @"JOHNNY CAN THROW THE ROCK!", nil];
        NSArray *karateChop = [NSArray arrayWithObjects:@"JOHNNY'S KARATE CHOP MISSED!", @"JOHNNY'S KARATE CHOP HIT YOU!", @"JOHNNY'S KARATE CHOP WAS PERFECT!", nil];
        NSArray *smother = [NSArray arrayWithObjects:@"JOHNNY TRIED TO SMOTHER YOU!", @"JOHNNY ALMOST SMOTHERED YOU!", @"JOHNNY REALLY SMOTHERED YOU!", nil];
        NSArray *infection = [NSArray arrayWithObjects:@"JOHNNY'S INFECTION KILLED HER!", @"JOHNNY'S INFECTION MIGHT SPREAD TO YOU!", @"JOHNNY'S INFECTION DIDN'T HOLD", nil];
        
        NSDictionary *attacks = [NSDictionary dictionaryWithObjectsAndKeys:rockThrow, @"Rock Throw", karateChop, @"Karate Chop", smother, @"Smother", infection, @"Infection", nil];
        NSDictionary *attacksDamage = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:20], @"Rock Throw", [NSNumber numberWithInt:10], @"Karate Chop", [NSNumber numberWithInt:15], @"Smother", [NSNumber numberWithInt:10], @"Infection", nil];
        
        [self setAttack:[[Attack alloc]initWithAttacks:attacks withDamage:attacksDamage]];
        [self setDefense:[[Defense alloc]initWithHP:[self fullHP]]];
    }
    
    return self;
}

@end
