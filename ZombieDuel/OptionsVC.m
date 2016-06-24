//
//  OptionsVC.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "OptionsVC.h"
#import "CustomAnimatedButton.h"
#import "DuelVC.h"

@interface OptionsVC ()
@property (weak, nonatomic) IBOutlet UIButton *nightThemeButton;
@property (weak, nonatomic) IBOutlet UIButton *dayThemeButton;
@property (weak, nonatomic) IBOutlet CustomAnimatedButton *hunterPlayerButton;
@property (weak, nonatomic) IBOutlet CustomAnimatedButton *hankPlayerButton;

@property (nonatomic) BOOL hunterChosen;
@property (nonatomic) BOOL nightChosen;
@end

@implementation OptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_hunterPlayerButton imageAnimationWithName:@"hunter_" withState:@"idle" withImageNumber:6];
    [_hankPlayerButton imageAnimationWithName:@"hank_" withState:@"idle" withImageNumber:6];
    
    _hunterChosen = YES;
    _nightChosen = YES;
}

- (IBAction)nightThemeButtonPressed:(id)sender {
    _nightThemeButton.alpha = 1.0;
    _nightThemeButton.userInteractionEnabled = NO;
    _dayThemeButton.alpha = 0.5;
    _dayThemeButton.userInteractionEnabled = YES;
    _nightChosen = YES;
}

- (IBAction)dayThemeButtonPressed:(id)sender {
    _dayThemeButton.alpha = 1.0;
    _dayThemeButton.userInteractionEnabled = NO;
    _nightThemeButton.alpha = 0.5;
    _nightThemeButton.userInteractionEnabled = YES;
    _nightChosen = NO;
}

- (IBAction)hunterPlayerButtonPressed:(id)sender {
    _hunterPlayerButton.alpha = 1.0;
    _hunterPlayerButton.userInteractionEnabled = NO;
    _hankPlayerButton.alpha = 0.5;
    _hankPlayerButton.userInteractionEnabled = YES;
    _hunterChosen = YES;
}

- (IBAction)hankPlayerButtonPressed:(id)sender {
    _hankPlayerButton.alpha = 1.0;
    _hankPlayerButton.userInteractionEnabled = NO;
    _hunterPlayerButton.alpha = 0.5;
    _hunterPlayerButton.userInteractionEnabled = YES;
    _hunterChosen = NO;
}

- (IBAction)startGameButtonPressed:(id)sender {
    //Create Player
    [self performSegueWithIdentifier:@"showDuelVC" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //Pass over theme and player
    if ([[segue identifier] isEqualToString:@"showDuelVC"]) {
        DuelVC *duelVC = [segue destinationViewController];
        
        [duelVC setNightThemeChosen:_nightChosen];
    }
}

@end
