//
//  Game.h
//  ZombieDuel
//
//  Created by James Dyer on 6/23/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enemy.h"
#import "Store.h"
#import "Turn.h"

@interface Game : NSObject
@property (nonatomic) Store *store;
@property (nonatomic) Turn *turn;
- (Enemy*)createEnemy;
- (void)updateLevel;
- (instancetype)init;
@end
