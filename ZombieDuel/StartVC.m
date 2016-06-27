//
//  StartVC.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "StartVC.h"
#import "AnimationEngine.h"

@interface StartVC ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *zombieConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *playerConstraint;
@property (weak, nonatomic) IBOutlet UILabel *highScoreLabel;
@property (nonatomic) AnimationEngine *playerAnimation;
@property (nonatomic) AnimationEngine *enemyAnimation;
@end

@implementation StartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _playerAnimation = [[AnimationEngine alloc]initLeftSideWithConstraint:_playerConstraint];
    _enemyAnimation = [[AnimationEngine alloc]initRightSideWithConstraint:_zombieConstraint];
    
    NSInteger highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScore"];
    
    if (highScore)
        _highScoreLabel.text = [NSString stringWithFormat:@"%ld", (long)highScore];
    else
        _highScoreLabel.text = @"0";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [_playerAnimation animateOnScreen];
    [_enemyAnimation animateOnScreen];
}

- (IBAction)playButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"showOptionsVC" sender:nil];
}


@end
