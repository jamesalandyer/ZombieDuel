//
//  Carl.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Carl.h"

@implementation Carl

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setName:@"CARL"];
        [self setFullHP:100];
        [self setCoinValue:7];
        
        NSArray *attackNames = [NSArray arrayWithObjects:@"Mummy Wrap", @"Lick", @"Roll", @"Infection", nil];
        NSArray *mummyWrap = [NSArray arrayWithObjects:@"CARL MISSED YOU!", @"CARL WRAPPED PART OF YOU LIKE A MUMMY!", @"CARL WRAPPED YOU UP LIKE A MUMMY!", nil];
        NSArray *lick = [NSArray arrayWithObjects:@"CARL TRIED TO LICK YOU!", @"CARL LICKED YOU!", @"CARL'S LICK WAS DISGUSTING!", nil];
        NSArray *roll = [NSArray arrayWithObjects:@"CARL ROLLED THE WRONG WAY!", @"CARL ROLLED INTO YOU!", @"CARL TOOK YOU OUT WITH HIS ROLL!", nil];
        NSArray *infection = [NSArray arrayWithObjects:@"CARL'S INFECTION KILLED HIM!", @"CARL'S INFECTION MIGHT SPREAD TO YOU!", @"CARL'S INFECTION DIDN'T HOLD", nil];
        
        NSDictionary *attacks = [NSDictionary dictionaryWithObjectsAndKeys:mummyWrap, @"Mummy Wrap", lick , @"Lick", roll, @"Roll", infection, @"Infection", nil];
        NSDictionary *attacksDamage = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:20], @"Mummy Wrap", [NSNumber numberWithInt:10], @"Lick", [NSNumber numberWithInt:15], @"Roll", [NSNumber numberWithInt:10], @"Infection", nil];
        
        [self setAttack:[[Attack alloc]initWithAttacks:attacks withDamage:attacksDamage withAttackNames:attackNames]];
        [self setDefense:[[Defense alloc]initWithHP:[self fullHP]]];
        [self setDeadImageNumber:5];
    }
    
    return self;
}

@end
