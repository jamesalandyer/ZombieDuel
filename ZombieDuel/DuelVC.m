//
//  DuelVC.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "DuelVC.h"
#import "Game.h"
#import "StoreVC.h"
#import "Player.h"
#import "Hunter.h"
#import "Hank.h"
#import "Enemy.h"
#import "CharacterAnimationImageView.h"
#import "CustomCircleButton.h"

@interface DuelVC ()
@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UIImageView *ground;
@property (weak, nonatomic) IBOutlet CharacterAnimationImageView *playerImageView;
@property (weak, nonatomic) IBOutlet CharacterAnimationImageView *enemyImageView;
@property (weak, nonatomic) IBOutlet UILabel *levelTextLabel;
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
@property (weak, nonatomic) IBOutlet CharacterAnimationImageView *playerInjuredImageView;
@property (weak, nonatomic) IBOutlet CharacterAnimationImageView *enemyInjuredImageView;
@property (weak, nonatomic) IBOutlet UIView *restartBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *restartView;
@property (weak, nonatomic) IBOutlet CharacterAnimationImageView *restartBobImageView;
@property (nonatomic) Game *game;
@property (nonatomic) Player *player;
@property (nonatomic) Enemy *enemy;
@property (nonatomic) AVAudioPlayer *sfxInjured;
@property (nonatomic) AVAudioPlayer *sfxDeath;
@end

@implementation DuelVC

#pragma mark Stack

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @try {
        _sfxInjured = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"injured" ofType:@"wav"]] error:nil];
        [_sfxInjured prepareToPlay];
        _sfxDeath = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"death" ofType:@"wav"]] error:nil];
        [_sfxDeath prepareToPlay];
    }
    
    @catch (NSException *exception){
        NSLog(@"%@", exception.debugDescription);
    }
    
    [self setGame:[[Game alloc]init]];
    
    if ([self hunterChosen]) {
        [self setPlayer:[[Hunter alloc]init]];
        [_playerImageView imageAnimationWithName:@"hunter_" withState:@"idle" withImageNumber:6];
    } else {
        [self setPlayer:[[Hank alloc]init]];
        [_playerImageView imageAnimationWithName:@"hank_" withState:@"idle" withImageNumber:6];
        [_playerSpecialAttackButton setImage:[UIImage imageNamed:@"axe.png"] forState:UIControlStateNormal];
    }
    
    if (!_nightThemeChosen)
        [self setDayTheme];
    
    [self setUI];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(increaseAttack:) name:@"attack" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(increaseHealth:) name:@"health" object:nil];
}

#pragma mark Actions

- (IBAction)attackButtonPressed:(id)sender {
    _attackButtons.hidden = true;
    NSString *result = [[_game turn] playerTurnWithPlayer:_player withAttack:[NSNumber numberWithInteger:[sender tag]] withEnemy:_enemy];
    [_textLabel setText:result];
    NSInteger newEnemyHP = [[_enemy defense] currentHP];
    NSInteger newPlayerHP = [[_player defense] currentHP];
    if (newEnemyHP > 0) {
        if (newPlayerHP > 0)
            [self enemyInjured];
        [_enemyHPLabel setText:[NSString stringWithFormat:@"%ld HP", (long)newEnemyHP]];
        _nextButton.hidden = false;
    } else {
        [_enemyHPLabel setText:@"0"];
        [self enemyDied];
    }
    if (newPlayerHP <= 0) {
        [_playerHPLabel setText:@"0"];
        [self playerDied];
    }
}

- (IBAction)nextButtonPressed:(id)sender {
    if ([[_nextButton currentTitle] isEqualToString:@"STORE"]) {
        [self performSegueWithIdentifier:@"showStoreVC" sender:nil];
        [self setUI];
    } else if ([[_nextButton currentTitle] isEqualToString:@"EXIT"]) {
        [self showRestart];
    } else {
        _nextButton.hidden = true;
        NSString *result = [[_game turn]enemyTurnWithEnemy:_enemy withPlayer:_player withMultiplier:[_game enemyDamageMultiplier]];
        [_textLabel setText:result];
        NSInteger newPlayerHP = [[_player defense] currentHP];
        NSInteger newEnemyHP = [[_enemy defense] currentHP];
        if (newPlayerHP > 0) {
            if (newEnemyHP > 0)
                [self playerInjured];
            [_playerHPLabel setText:[NSString stringWithFormat:@"%ld HP", (long)newPlayerHP]];
        } else {
            [_playerHPLabel setText:@"0"];
            [self playerDied];
        }
        if (newEnemyHP <= 0) {
            [_enemyHPLabel setText:@"0"];
            [self enemyDied];
        }
        
        if (newEnemyHP > 0 && newPlayerHP > 0)
            _attackButtons.hidden = false;
    }
}

- (IBAction)tryAgainButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Adjusting UI

/**
 * Sets up the UI for the start of a level.
 */
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
    [_playerHPLabel setText:[NSString stringWithFormat:@"%ld HP", (long)[_player fullHP]]];
    
    [_levelLabel setText:[NSString stringWithFormat:@"%ld", (long)[_game currentLevel]]];
    [_textLabel setText:[NSString stringWithFormat:@"%@ HAS CHALLENGED YOU TO A DUEL", [_enemy name]]];
}

/**
 * Sets the UI to show the day theme.
 */
- (void)setDayTheme {
    UIColor *dayColor = [UIColor colorWithRed: (255.0 / 255.0) green: (207.0 / 255.0) blue:(109.0 / 255.0) alpha:1.0];
    [_background setImage:[UIImage imageNamed:@"background_day.png"]];
    [_ground setImage:[UIImage imageNamed:@"ground_day.png"]];
    
    [_levelTextLabel setTextColor:dayColor];
    [_levelLabel setTextColor:dayColor];
    [_nextButton setBackgroundColor:dayColor];
    [_playerHPLabel setTextColor:dayColor];
    [_enemyHPLabel setTextColor:dayColor];
    
    [_playerSpecialAttackButton setBackgroundColor:dayColor];
    [_pumpkinAttackButton setBackgroundColor:dayColor];
    [_sawAttackButton setBackgroundColor:dayColor];
    [_unknownAttackButton setBackgroundColor:dayColor];
}

/**
 * Shows a screen to allow you to restart.
 */
- (void)showRestart {
    [_restartBobImageView imageAnimationWithName:@"bob_" withState:@"idle" withImageNumber:6];
    _restartBackgroundView.hidden = false;
    _restartView.hidden = false;
}

#pragma mark Injured Animation

/**
 * Shows the imageview with the player as being injured.
 */
- (void)playerInjured {
    [self playInjuredSound];
    [_playerInjuredImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_injured.png", [[_player name] lowercaseString]]]];
    _playerInjuredImageView.hidden = false;
    [NSTimer scheduledTimerWithTimeInterval:0.30 target:self selector:@selector(hidePlayerInjured) userInfo:nil repeats:false];
}

/**
 * Hides the imageview for the player.
 */
- (void)hidePlayerInjured {
    _playerInjuredImageView.hidden = true;
}

/**
 * Shows the imageview with the enemy as being injured.
 */
- (void)enemyInjured {
    [self playInjuredSound];
    [_enemyInjuredImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_injured.png", [[_enemy name] lowercaseString]]]];
    _enemyInjuredImageView.hidden = false;
    [NSTimer scheduledTimerWithTimeInterval:0.30 target:self selector:@selector(hideEnemyInjured) userInfo:nil repeats:false];
}

/**
 * Hides the imageview for the enemy.
 */
- (void)hideEnemyInjured {
    _enemyInjuredImageView.hidden = true;
}

#pragma mark Purchase Changes

/**
 * Increases the players attack.
 *
 * @param notification The notification being recieved.
 */
- (void)increaseAttack:(NSNotification *)notification {
    NSNumber *increaseAmount = (NSNumber*)[notification object];
    [_player increaseDamage:increaseAmount.integerValue];
}

/**
 * Increases the players health.
 *
 * @param notification The notification being recieved.
 */
- (void)increaseHealth:(NSNotification *)notification {
    NSNumber *increaseAmount = (NSNumber*)[notification object];
    [_player increaseHP:increaseAmount.integerValue];
    [_playerHPLabel setText:[NSString stringWithFormat:@"%ld HP", (long)[_player fullHP]]];
}

#pragma mark Death Animation

/**
 * Starts the animation for when the player dies.
 */
- (void)playerDied {
    [self playDeathSound];
    _playerDeathImageView.hidden = false;
    _playerImageView.hidden = true;
    [_playerDeathImageView imageAnimationWithName:[NSString stringWithFormat:@"%@_", [[_player name] lowercaseString]] withState:@"dead" withImageNumber:(int)[_player deadImageNumber]];
    if ([[_player defense] currentHP] > -500)
        [_textLabel setText:[NSString stringWithFormat:@"YOU WERE KILLED BY %@", [_enemy name]]];
    [_nextButton setTitle:@"EXIT" forState:UIControlStateNormal];
    _nextButton.hidden = false;
}

/**
 * Starts the animation for when the enemy dies.
 */
- (void)enemyDied {
    [self playDeathSound];
    _enemyDeathImageView.hidden = false;
    _enemyImageView.hidden = true;
    [_enemyDeathImageView imageAnimationWithName:[NSString stringWithFormat:@"%@_", [[_enemy name] lowercaseString]] withState:@"dead" withImageNumber:(int)[_enemy deadImageNumber]];
    [[_game store] getCoinsForKill:[_enemy coinValue]];
    if ([[_enemy defense] currentHP] > -500)
        [_textLabel setText:[NSString stringWithFormat:@"YOU KILLED %@", [_enemy name]]];
    [_game updateLevel];
    [[_player defense] resetHP:[_player fullHP]];
    [_nextButton setTitle:@"STORE" forState:UIControlStateNormal];
    _nextButton.hidden = false;
}

#pragma mark Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showStoreVC"]) {
        StoreVC *storeVC = [segue destinationViewController];
        [storeVC setGame:_game];
        [storeVC setNightTheme:[self nightThemeChosen]];
    }
}

#pragma mark Sounds

/**
 * Plays the sound when a character gets injured.
 */
- (void)playInjuredSound {
    if (_sfxInjured.playing)
        [_sfxInjured stop];
    [_sfxInjured play];
}

/**
 * Plays the sound when a character dies.
 */
- (void)playDeathSound {
    if (_sfxDeath.playing)
        [_sfxDeath stop];
    [_sfxDeath play];
}

@end
