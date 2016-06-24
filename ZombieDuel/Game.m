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


@interface Game ()

@property (nonatomic) NSInteger currentLevel;
@property (nonatomic) NSInteger bossLevelCount;
@property (nonatomic) NSInteger highestLevel;

@end

@implementation Game

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setCurrentLevel:1];
        [self setHighestLevel:(NSInteger)[[NSUserDefaults standardUserDefaults] objectForKey:@"HighScore"]];
        [self setStore:[[Store alloc]init]];
    }
        
    return self;
}

- (Enemy*)createEnemy {
    if (_bossLevelCount == 10) {
        return [[Bob alloc]init];
    } else {
        int rand = arc4random_uniform(21);
        
        if (rand >= 19)
            return [[Jack alloc]init];
        else if (rand >= 17)
            return [[Melissa alloc]init];
        else if (rand >= 15)
            return [[Timmy alloc]init];
        else if (rand >= 12)
            return [[Johnny alloc]init];
        else if (rand >= 8)
            return [[Kip alloc]init];
        else if (rand >= 5)
            return [[Sally alloc]init];
        else
            return [[Carl alloc]init];
    }
        
}

- (void)updateLevel {
    [self setCurrentLevel:_currentLevel + 1];
    [self setBossLevelCount:_bossLevelCount + 1];
    if (_currentLevel > _highestLevel)
        [[NSUserDefaults standardUserDefaults] setInteger:_currentLevel forKey:@"HighScore"];
}

@end
