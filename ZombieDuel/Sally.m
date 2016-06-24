//
//  Sally.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Sally.h"

@implementation Sally

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setName:@"Sally"];
        [self setFullHP:(NSInteger)100];
        [self setCoinValue:(NSInteger)7];
        
        NSArray *chase = [NSArray arrayWithObjects:@"SALLY GOT STUCK!", @"SALLY CHASED YOU!", @"SALLY CHASED YOU INTO A TREE!", nil];
        NSArray *eyeThrow = [NSArray arrayWithObjects:@"SALLY DROPPED HER EYE!", @"SALLY'S EYE BOUNCED OFF OF YOU!", @"SALLY'S EYE HIT YOU IN THE EYE!", nil];
        NSArray *kick = [NSArray arrayWithObjects:@"SALLY CAN'T KICK!", @"SALLY'S KICKS ARE INEFFECTIVE!", @"SALLY HURT YOU WITH HER KICK!", nil];
        NSArray *infection = [NSArray arrayWithObjects:@"SALLY'S INFECTION KILLED HER!", @"SALLY'S INFECTION MIGHT SPREAD TO YOU!", @"SALLY'S INFECTION DIDN'T HOLD", nil];
        
        NSDictionary *attacks = [NSDictionary dictionaryWithObjectsAndKeys:chase, @"Chase", eyeThrow , @"Eye Throw", kick, @"Kick", infection, @"Infection", nil];
        NSDictionary *attacksDamage = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:20], @"Chase", [NSNumber numberWithInt:10], @"Eye Throw", [NSNumber numberWithInt:15], @"Kick", [NSNumber numberWithInt:10], @"Infection", nil];
        
        [self setAttack:[[Attack alloc]initWithAttacks:attacks withDamage:attacksDamage]];
        [self setDefense:[[Defense alloc]initWithHP:[self fullHP]]];
    }
    
    return self;
}

@end
