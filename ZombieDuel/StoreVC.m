//
//  StoreVC.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "StoreVC.h"
#import "Game.h"
#import "CustomRoundedButton.h"

@interface StoreVC ()
@property (weak, nonatomic) IBOutlet CustomRoundedButton *bulletProofVestButton;
@property (weak, nonatomic) IBOutlet CustomRoundedButton *moreAmmoButton;
@property (weak, nonatomic) IBOutlet CustomRoundedButton *zombieRepellentButton;
@property (weak, nonatomic) IBOutlet CustomRoundedButton *sleepButton;
@property (weak, nonatomic) IBOutlet CustomRoundedButton *nextLevelButton;
@property (weak, nonatomic) IBOutlet UILabel *currentSuppliesLabel;
@property (weak, nonatomic) IBOutlet UILabel *suppliesLabel;
@end

@implementation StoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_bulletProofVestButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [_moreAmmoButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [_zombieRepellentButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [_sleepButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [_nextLevelButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [_currentSuppliesLabel setText:[NSString stringWithFormat:@"%ld", (long)[[_game store] currentCoins]]];
    
    if (!_nightTheme)
        [self setDayTheme];
}

- (IBAction)purchaseButton:(id)sender {
    int coinAmount;
    coinAmount = [sender tag] == 0 || [sender tag] == 2 ? 10 : 50;
    
    if ([[_game store] purchaseItemWithPrice:coinAmount]) {
        [self purchaseFailed:NO];
        [_currentSuppliesLabel setText:[NSString stringWithFormat:@"%ld", (long)[[_game store] currentCoins]]];
        if ([sender tag] > 1) {
            NSNotification *notif = [[NSNotification alloc] initWithName:@"attack" object:[NSNumber numberWithInt:coinAmount] userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:notif];
        } else {
            NSNotification *notif = [[NSNotification alloc] initWithName:@"health" object:[NSNumber numberWithInt:coinAmount] userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:notif];
        }
    } else {
        [self purchaseFailed:YES];
    }
}


- (IBAction)nextLevelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)purchaseFailed: (BOOL)failed {
    if (failed) {
        [_currentSuppliesLabel setTextColor:[UIColor redColor]];
        [_suppliesLabel setTextColor:[UIColor redColor]];
    } else {
        [_currentSuppliesLabel setTextColor:[UIColor greenColor]];
        [_suppliesLabel setTextColor:[UIColor greenColor]];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:0.35 target:self selector:@selector(revertLabel) userInfo:nil repeats:false];
}

- (void)revertLabel {
    [_currentSuppliesLabel setTextColor:[UIColor whiteColor]];
    [_suppliesLabel setTextColor:[UIColor whiteColor]];
}

- (void)setDayTheme {
    UIColor *dayColor = [UIColor colorWithRed: (255.0 / 255.0) green: (207.0 / 255.0) blue:(109.0 / 255.0) alpha:1.0];
    [_bulletProofVestButton setBackgroundColor:dayColor];
    [_moreAmmoButton setBackgroundColor:dayColor];
    [_zombieRepellentButton setBackgroundColor:dayColor];
    [_sleepButton setBackgroundColor:dayColor];
    [_nextLevelButton setBackgroundColor:dayColor];
}

@end
