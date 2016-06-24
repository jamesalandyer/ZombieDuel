//
//  Store.m
//  ZombieDuel
//
//  Created by James Dyer on 6/23/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "Store.h"

@implementation Store

- (BOOL)purchaseItemWithPrice: (NSInteger)price {
    if (price <= _currentCoins) {
        [self setCurrentCoins:_currentCoins - price];
        return YES;
    } else {
        return NO;
    }
}

- (void)getCoinsForKill: (NSInteger)amount {
    [self setCurrentCoins:_currentCoins + amount];
}

@end
