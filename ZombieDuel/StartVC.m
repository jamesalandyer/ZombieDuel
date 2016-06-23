//
//  StartVC.m
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "StartVC.h"

@interface StartVC ()
@property (weak, nonatomic) IBOutlet UILabel *highScoreLabel;
@end

@implementation StartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger highScore = (NSInteger)[[NSUserDefaults standardUserDefaults] objectForKey:@"HighScore"];
    
    if (highScore)
        _highScoreLabel.text = [NSString stringWithFormat:@"%d", highScore];
    else
        _highScoreLabel.text = @"00";
}

- (IBAction)playButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"showOptionsVC" sender:nil];
}


@end
