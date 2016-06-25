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
@property (weak, nonatomic) IBOutlet UIStackView *attackButtons;
@property (weak, nonatomic) IBOutlet CustomCircleButton *nextButton;
@property (weak, nonatomic) IBOutlet CharacterAnimationImageView *playerDeathImageView;
@property (weak, nonatomic) IBOutlet CharacterAnimationImageView *enemyDeathImageView;
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
        [_playerSpecialAttackButton setImage:[UIImage imageNamed:@"axe.png"] forState:UIControlStateNormal];
    }
    
    [self setUI];
}

- (IBAction)attackButtonPressed:(id)sender {
    _attackButtons.hidden = true;
    NSString *result = [[_game turn] playerTurnWithPlayer:_player withAttack:[NSNumber numberWithInteger:[sender tag]] withEnemy:_enemy];
    [_textLabel setText:result];
    NSInteger newEnemyHP = [[_enemy defense] currentHP];
    if (newEnemyHP > 0) {
        [self characterImageInjuredWithCharacter:_enemy];
        [_enemyHPLabel setText:[NSString stringWithFormat:@"%ld HP", (long)newEnemyHP]];
    } else {
        [_enemyHPLabel setText:@"0"];
        [self enemyDied];
    }
    NSInteger newPlayerHP = [[_player defense] currentHP];
    if (newPlayerHP <= 0) {
        [_playerHPLabel setText:@"0"];
        [self playerDied];
    } else {
        _nextButton.hidden = false;
    }
}

- (IBAction)nextButtonPressed:(id)sender {
    if ([[_nextButton currentTitle] isEqualToString:@"NEXT LEVEL"]) {
        [self performSegueWithIdentifier:@"showStoreVC" sender:nil];
        [self setUI];
    } else if ([[_nextButton currentTitle] isEqualToString:@"EXIT"]) {
        [self performSegueWithIdentifier:@"showRestartVC" sender:nil];
    } else {
        _nextButton.hidden = true;
        NSString *result = [[_game turn]enemyTurnWithEnemy:_enemy withPlayer:_player];
        [_textLabel setText:result];
        NSInteger newPlayerHP = [[_player defense] currentHP];
        if (newPlayerHP > 0) {
            [self characterImageInjuredWithCharacter:_player];
            [_playerHPLabel setText:[NSString stringWithFormat:@"%ld HP", (long)newPlayerHP]];
        } else {
            [_playerHPLabel setText:@"0"];
            [self playerDied];
        }
        NSInteger newEnemyHP = [[_enemy defense] currentHP];
        if (newEnemyHP <= 0) {
            [_enemyHPLabel setText:@"0"];
            [self enemyDied];
        } else {
            _attackButtons.hidden = false;
        }
    }
}

- (void)setUI {
    _enemyImageView.hidden = false;
    _enemyDeathImageView.hidden = true;
    _nextButton.hidden = true;
    _attackButtons.hidden = false;
    [_nextButton setTitle:@"NEXT" forState:UIControlStateNormal];
    [self setEnemy:[_game createEnemy]];
    int imageNumber = ([_enemy.name isEqualToString:@"TIMMY"]) ? 1 : 6;
    [_enemyImageView imageAnimationWithName:[NSString stringWithFormat:@"%@_", _enemy.name.lowercaseString] withState:@"idle" withImageNumber:imageNumber];
    [_enemyNameLabel setText:[_enemy name]];
    [_enemyHPLabel setText:[NSString stringWithFormat:@"%ld HP", (long)[_enemy fullHP]]];
    
    [_playerNameLabel setText:[_player name]];
    [_playerHPLabel setText:[NSString stringWithFormat:@"%ld HP", (long)[_enemy fullHP]]];
    
    [_levelLabel setText:[NSString stringWithFormat:@"%ld", (long)[_game currentLevel]]];
    [_textLabel setText:[NSString stringWithFormat:@"%@ HAS CHALLENGED YOU TO A DUEL", [_enemy name]]];
}

- (void)characterImageInjuredWithCharacter: (Character*)character {
    NSLog(@"Injured");
}

- (void)playerDied {
    _playerDeathImageView.hidden = false;
    _playerImageView.hidden = true;
    [_playerDeathImageView imageAnimationWithName:[NSString stringWithFormat:@"%@_", [[_player name] lowercaseString]] withState:@"dead" withImageNumber:(int)[_player deadImageNumber]];
    if ([[_player defense] currentHP] > -500)
        [_textLabel setText:[NSString stringWithFormat:@"YOU WERE KILLED BY %@", [_enemy name]]];
    [_nextButton setTitle:@"EXIT" forState:UIControlStateNormal];
    _nextButton.hidden = false;
}

- (void)enemyDied {
    _enemyDeathImageView.hidden = false;
    _enemyImageView.hidden = true;
    [_enemyDeathImageView imageAnimationWithName:[NSString stringWithFormat:@"%@_", [[_enemy name] lowercaseString]] withState:@"dead" withImageNumber:(int)[_enemy deadImageNumber]];
    [[_game store] getCoinsForKill:[_enemy coinValue]];
    [_game updateLevel];
    [_nextButton setTitle:@"NEXT LEVEL" forState:UIControlStateNormal];
    _nextButton.hidden = false;
}

@end
