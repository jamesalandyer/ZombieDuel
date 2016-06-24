//
//  Kip.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Kip.h"

@implementation Kip

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setName:@"KIP"];
        [self setFullHP:(NSInteger)100];
        [self setCoinValue:(NSInteger)8];
        
        NSArray *panThrow = [NSArray arrayWithObjects:@"KIP'S PAN MISSED YOU!", @"KIP'S PAN HIT YOU!", @"KIP'S PAN HIT YOU RIGHT IN THE HEAD!", nil];
        NSArray *headButt = [NSArray arrayWithObjects:@"KIP SLIPPED AND MISSED YOU!", @"KIP HEAD BUTTED YOU!", @"KIP'S HEAD BUTT WAS REALLY EFFECTIVE!", nil];
        NSArray *sear = [NSArray arrayWithObjects:@"KIP TRIED TO SEAR YOU!", @"KIP KIND OF SEARED YOU!", @"KIP SEARED YOUR FACE!", nil];
        NSArray *infection = [NSArray arrayWithObjects:@"KIP'S INFECTION KILLED HER!", @"KIP'S INFECTION MIGHT SPREAD TO YOU!", @"KIP'S INFECTION DIDN'T HOLD", nil];
        
        NSDictionary *attacks = [NSDictionary dictionaryWithObjectsAndKeys:panThrow, @"Pan Throw", headButt , @"Head Butt", sear, @"Sear", infection, @"Infection", nil];
        NSDictionary *attacksDamage = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:20], @"Pan Throw", [NSNumber numberWithInt:10], @"Head Butt", [NSNumber numberWithInt:15], @"Sear", [NSNumber numberWithInt:10], @"Infection", nil];
        
        [self setAttack:[[Attack alloc]initWithAttacks:attacks withDamage:attacksDamage]];
        [self setDefense:[[Defense alloc]initWithHP:[self fullHP]]];
    }
    
    return self;
}

@end
