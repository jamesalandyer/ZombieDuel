//
//  Store.h
//  ZombieDuel
//
//  Created by James Dyer on 6/23/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject
@property (nonatomic) NSInteger currentCoins;
- (BOOL)purchaseItemWithPrice: (NSInteger)price;
- (void)getCoinsForKill: (NSInteger)amount;
@end
