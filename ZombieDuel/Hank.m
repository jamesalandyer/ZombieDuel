//
//  Hank.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Hank.h"

@implementation Hank

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setName:@"HANK"];
        [self setFullHP:(NSInteger)100];
        
        NSArray *axeThrow = [NSArray arrayWithObjects:@"YOUR AXE THROW MISSED!", @"YOUR AXE CUT THE ZOMBIE'S HAND OFF!", @"YOUR AXE IMPALED THE ZOMBIE!", nil];
        NSArray *pumpkinThrow = [NSArray arrayWithObjects:@"THE PUMPKIN FELL SHORT!", @"THE PUMPKIN DID SOME DAMAGE!", @"THE ZOMBIE IS NOW WEARING PUMPKIN!", nil];
        NSArray *sawSlice = [NSArray arrayWithObjects:@"THE SAW IS DEFFECTIVE", @"THE SAW DIDN'T CUT IT!", @"THE SAW DID WORK!", nil];
        NSArray *unknown = [NSArray arrayWithObjects:@"WEAPONS ARE DANGEROUS: YOU COMMITED SUICIDE", @"SURPRISE!", @"DID IT WORK?", nil];
        
        NSDictionary *attacks = [NSDictionary dictionaryWithObjectsAndKeys:axeThrow, @"Axe Throw", pumpkinThrow, @"Pumpkin Throw", sawSlice, @"Saw Slice", unknown, @"Unknown", nil];
        NSDictionary *attacksDamage = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:20], @"Axe Throw", [NSNumber numberWithInt:10], @"Pumpkin Throw", [NSNumber numberWithInt:15], @"Saw Slice", [NSNumber numberWithInt:10], @"Unknown", nil];
        
        [self setAttack:[[Attack alloc]initWithAttacks:attacks withDamage:attacksDamage]];
        [self setDefense:[[Defense alloc]initWithHP:[self fullHP]]];
    }
    
    return self;
}

@end
