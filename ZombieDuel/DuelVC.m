//
//  DuelVC.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "DuelVC.h"
#import "Game.h"
#import "Player.h"
#import "Hunter.h"
#import "Hank.h"
#import "Enemy.h"
#import "CharacterAnimationImageView.h"
#import "CustomCircleButton.h"

@interface DuelVC ()
@property (weak, nonatomic) IBOutlet CharacterAnimationImageView *playerImageView;
@property (weak, nonatomic) IBOutlet CharacterAnimationImageView *enemyImageView;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerHPLabel;
@property (weak, nonatomic) IBOutlet UILabel *enemyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *enemyHPLabel;
@property (weak, nonatomic) IBOutlet CustomCircleButton *playerSpecialAttackButton;
@property (weak, nonatomic) IBOutlet CustomCircleButton *pumpkinAttackButton;
@property (weak, nonatomic) IBOutlet CustomCircleButton *sawAttackButton;
@property (weak, nonatomic) IBOutlet CustomCircleButton *unknownAttackButton;
@property (nonatomic) Game *game;
@property (nonatomic) Player *player;
@property (nonatomic) Enemy *enemy;
@end

@implementation DuelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setGame:[[Game alloc]init]];
    
    if ([self hunterChosen]) {
        [self setPlayer:[[Hunter alloc]init]];
        [_playerImageView imageAnimationWithName:@"hunter_" withState:@"idle" withImageNumber:6];
    } else {
        [self setPlayer:[[Hank alloc]init]];
        [_playerImageView imageAnimationWithName:@"hank_" withState:@"idle" withImageNumber:6];
    }
    
    [self setEnemy:[_game createEnemy]];
    
    int imageNumber = ([_enemy.name isEqualToString:@"TIMMY"]) ? 1 : 6;
    
    [_enemyImageView imageAnimationWithName:[NSString stringWithFormat:@"%@_", _enemy.name.lowercaseString] withState:@"idle" withImageNumber:imageNumber];
}

- (IBAction)attackButtonPressed:(id)sender {
    
}


@end
