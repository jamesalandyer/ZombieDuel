//
//  StoreVC.h
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface StoreVC : UIViewController
@property (nonatomic) Game *game;
@property (nonatomic) BOOL nightTheme;
@end
