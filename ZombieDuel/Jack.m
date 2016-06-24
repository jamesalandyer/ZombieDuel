//
//  Jack.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Jack.h"

@implementation Jack

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setName:@"JACK"];
        [self setFullHP:(NSInteger)100];
        [self setCoinValue:(NSInteger)12];
        
        NSArray *clubSwing = [NSArray arrayWithObjects:@"JACK'S CLUB SWING MISSED YOU!", @"JACK'S CLUB DOESN'T HURT THAT BAD", @"JACK'S CLUB REALLY HURTS!", nil];
        NSArray *bite = [NSArray arrayWithObjects:@"YOU DODGED JACK'S BITE!", @"JACK'S BITE WAS NOT PLEASANT!", @"JACK'S BITE REALLY HURT!", nil];
        NSArray *claw = [NSArray arrayWithObjects:@"JACK'S CLAWS ALMOST HIT YOU!", @"JACK'S CLAWS WERE DULL!", @"JACK'S CLAWS MADE A MARK ON YOU!", nil];
        NSArray *infection = [NSArray arrayWithObjects:@"JACK'S INFECTION KILLED HIM!", @"JACK'S INFECTION MIGHT SPREAD TO YOU!", @"JACK'S INFECTION DIDN'T HOLD", nil];
        
        NSDictionary *attacks = [NSDictionary dictionaryWithObjectsAndKeys:clubSwing, @"Club Swing", bite, @"Bite", claw, @"Claw", infection, @"Infection", nil];
        NSDictionary *attacksDamage = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:20], @"Club Swing", [NSNumber numberWithInt:10], @"Bite", [NSNumber numberWithInt:15], @"Claw", [NSNumber numberWithInt:10], @"Infection", nil];
        
        [self setAttack:[[Attack alloc]initWithAttacks:attacks withDamage:attacksDamage]];
        [self setDefense:[[Defense alloc]initWithHP:[self fullHP]]];
    }
    
    return self;
}

@end
