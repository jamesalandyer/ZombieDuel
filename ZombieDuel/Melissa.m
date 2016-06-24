//
//  Melissa.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Melissa.h"

@implementation Melissa

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setName:@"MELISSA"];
        [self setFullHP:(NSInteger)100];
        [self setCoinValue:(NSInteger)11];
        
        NSArray *charge = [NSArray arrayWithObjects:@"MELISSA'S CHARGE WENT PAST YOU!", @"YOU WERE HURT BY MELISSA'S CHARGE", @"MELISSA'S CHARGE KNOCKED YOU DOWN!", nil];
        NSArray *grab = [NSArray arrayWithObjects:@"MELISSA TRIED TO GRAB YOU!", @"MELISSA'S GRAB DID SOME DAMAGE!", @"MELISSA'S GRAB HAD QUITE AN EFFECT!", nil];
        NSArray *whack = [NSArray arrayWithObjects:@"MELISSA'S WHACK MISSED!", @"MELISSA'S WHACK WAS SOFT!", @"MELISSA'S WHACK LEFT A MARK!", nil];
        NSArray *infection = [NSArray arrayWithObjects:@"MELISSA'S INFECTION KILLED HER!", @"MELISSA'S INFECTION MIGHT SPREAD TO YOU!", @"MELISSA'S INFECTION DIDN'T HOLD", nil];
        
        NSDictionary *attacks = [NSDictionary dictionaryWithObjectsAndKeys:charge, @"Charge", grab, @"Grab", whack, @"Whack", infection, @"Infection", nil];
        NSDictionary *attacksDamage = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:20], @"Charge", [NSNumber numberWithInt:10], @"Grab", [NSNumber numberWithInt:15], @"Whack", [NSNumber numberWithInt:10], @"Infection", nil];
        
        [self setAttack:[[Attack alloc]initWithAttacks:attacks withDamage:attacksDamage]];
        [self setDefense:[[Defense alloc]initWithHP:[self fullHP]]];
    }
    
    return self;
}

@end
