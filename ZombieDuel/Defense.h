//
//  Defense.h
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Defense : NSObject
@property (nonatomic) NSInteger currentHP;
- (instancetype)initWithHP: (NSInteger)hp;
- (void)resetHP: (NSInteger)fullHP;
- (NSInteger)inflictDamage: (NSInteger)damage;
@end
