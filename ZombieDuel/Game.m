//
//  Game.m
//  ZombieDuel
//
//  Created by James Dyer on 6/23/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Game.h"
#import "Enemy.h"
#import "Bob.h"
#import "Jack.h"
#import "Melissa.h"
#import "Timmy.h"
#import "Johnny.h"
#import "Kip.h"
#import "Sally.h"
#import "Carl.h"
#import "Store.h"
#import "Turn.h"


@interface Game ()
@property (nonatomic) NSInteger bossLevelCount;
@property (nonatomic) NSInteger highestLevel;
@property (nonatomic) NSInteger healthIncrease;
@end

@implementation Game

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setCurrentLevel:1];
        [self setHighestLevel:(NSInteger)[[NSUserDefaults standardUserDefaults] objectForKey:@"HighScore"]];
        [self setStore:[[Store alloc]init]];
        [self setTurn:[[Turn alloc]init]];
    }
        
    return self;
}

- (Enemy*)createEnemy {
    if (_bossLevelCount == 9) {
        return [[Bob alloc]init];
    } else {
        int rand = arc4random_uniform(21);
        
        if (rand >= 19) {
            Jack *jack = [[Jack alloc]init];
            [jack setFullHP:([jack fullHP] + _healthIncrease)];
            return jack;
        } else if (rand >= 17) {
            Melissa *melissa = [[Melissa alloc]init];
            [melissa setFullHP:([melissa fullHP] + _healthIncrease)];
            return melissa;
        } else if (rand >= 15) {
            Timmy *timmy = [[Timmy alloc]init];
            [timmy setFullHP:([timmy fullHP] + _healthIncrease)];
            return timmy;
        } else if (rand >= 12) {
            Johnny *johnny = [[Johnny alloc]init];
            [johnny setFullHP:([johnny fullHP] + _healthIncrease)];
            return johnny;
        } else if (rand >= 8) {
            Kip *kip = [[Kip alloc]init];
            [kip setFullHP:([kip fullHP] + _healthIncrease)];
            return kip;
        } else if (rand >= 5) {
            Sally *sally = [[Sally alloc]init];
            [sally setFullHP:([sally fullHP] + _healthIncrease)];
            return sally;
        } else {
            Carl *carl = [[Carl alloc]init];
            [carl setFullHP:([carl fullHP] + _healthIncrease)];
            return carl;
        }
    }
        
}

- (NSInteger)enemyDamageMultiplier {
    NSInteger number = ceil(_currentLevel * 0.5);
    
    return number;
}

- (void)increaseEnemyHealth {
    [self setHealthIncrease:_healthIncrease + 50];
}

- (void)updateLevel {
    [self setCurrentLevel:_currentLevel + 1];
    [self setBossLevelCount:_bossLevelCount + 1];
    
    if (_currentLevel > _highestLevel)
        [[NSUserDefaults standardUserDefaults] setInteger:_currentLevel forKey:@"HighScore"];
    if (_bossLevelCount == 10) {
        [self increaseEnemyHealth];
        [self setBossLevelCount:0];
    }
}

@end
