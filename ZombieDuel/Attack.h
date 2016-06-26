//
//  Attack.h
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Attack : NSObject
- (instancetype)initWithAttacks: (NSDictionary*)attacks withDamage: (NSDictionary*)damage withAttackNames: (NSArray*)attackNames;
- (NSMutableDictionary*)attackWithAttack: (NSNumber*)attack;
@end
