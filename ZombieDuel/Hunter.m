//
//  Hunter.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Hunter.h"

@implementation Hunter

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setName:@"HUNTER"];
        [self setFullHP:100];
        
        NSArray *attackNames = [NSArray arrayWithObjects:@"Shotgun Blast", @"Pumpkin Throw", @"Saw Slice", @"Mystery", nil];
        NSArray *shotgunBlast = [NSArray arrayWithObjects:@"YOUR SHOTGUN BLAST MISSED!", @"YOUR SHOTGUN CLIPPED THE ZOMBIE!", @"YOUR SHOTGUN MADE A DIRECT HIT!", nil];
        NSArray *pumpkinThrow = [NSArray arrayWithObjects:@"THE PUMPKIN SLIPPED OUT OF YOUR HANDS!", @"THE PUMPKIN WAS OLD!", @"THE ZOMBIE KNOWS WHAT PUMPKIN TASTES LIKE!", nil];
        NSArray *sawSlice = [NSArray arrayWithObjects:@"THE SAW DIDN'T TURN ON", @"THE SAW WAS DULL!", @"THE SAW SLICED RIGHT THROUGH!", nil];
        NSArray *mystery = [NSArray arrayWithObjects:@"WEAPONS ARE DANGEROUS: YOU COMMITED SUICIDE", @"WOW, THAT REALLY WORKED!", @"THATS IT?", nil];
        
        NSDictionary *attacks = [NSDictionary dictionaryWithObjectsAndKeys:shotgunBlast, @"Shotgun Blast", pumpkinThrow, @"Pumpkin Throw", sawSlice, @"Saw Slice", mystery, @"Mystery", nil];
        NSDictionary *attacksDamage = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:20], @"Shotgun Blast", [NSNumber numberWithInt:10], @"Pumpkin Throw", [NSNumber numberWithInt:15], @"Saw Slice", [NSNumber numberWithInt:10], @"Mystery", nil];
        
        [self setAttack:[[Attack alloc]initWithAttacks:attacks withDamage:attacksDamage withAttackNames:attackNames]];
        [self setDefense:[[Defense alloc]initWithHP:[self fullHP]]];
        [self setDeadImageNumber:6];
    }
    
    return self;
}



@end
