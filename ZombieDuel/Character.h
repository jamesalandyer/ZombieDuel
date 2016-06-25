//
//  Character.h
//  ZombieDuel
//
//  Created by James Dyer on 6/22/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Attack.h"
#import "Defense.h"

@interface Character : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger fullHP;
@property (nonatomic) Attack *attack;
@property (nonatomic) Defense *defense;
@property (nonatomic) NSInteger deadImageNumber;
@end
