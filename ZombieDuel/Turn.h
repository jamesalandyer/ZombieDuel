//
//  Turn.h
//  ZombieDuel
//
//  Created by James Dyer on 6/24/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Enemy.h"

@interface Turn : NSObject
- (NSString*)playerTurnWithPlayer: (Player*)player withAttack: (NSNumber*)attack withEnemy: (Enemy*)enemy;
- (NSString*)enemyTurnWithEnemy: (Enemy*)enemy withPlayer: (Player*)player;
@end
