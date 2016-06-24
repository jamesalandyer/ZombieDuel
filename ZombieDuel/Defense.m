//
//  Defense.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Defense.h"

@implementation Defense

- (instancetype)initWithHP: (NSInteger)hp {
    self = [super init];
    
    if (self)
        [self setCurrentHP:hp];
    
    return self;
}

- (void)resetHP: (NSInteger)fullHP {
    [self setCurrentHP:fullHP];
}

- (NSInteger)inflictDamage: (NSInteger)damage {
    [self setCurrentHP:(self.currentHP - damage)];
    
    return [self currentHP];
}

@end
