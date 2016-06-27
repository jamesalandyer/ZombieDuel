//
//  Store.m
//  ZombieDuel
//
//  Created by James Dyer on 6/23/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Store.h"

@implementation Store

/**
 * Tries to purchase the items by deducting coins.
 *
 * @param price The price of the item the player is trying to purchase.
 *
 * @return A bool of whether the player purchased the item.
 */
- (BOOL)purchaseItemWithPrice: (NSInteger)price {
    if (price <= _currentCoins) {
        [self setCurrentCoins:_currentCoins - price];
        return YES;
    } else {
        return NO;
    }
}

/**
 * Adds coins to the player.
 *
 * @param amount The amount of coins to add.
 */
- (void)getCoinsForKill: (NSInteger)amount {
    [self setCurrentCoins:_currentCoins + amount];
}

@end
