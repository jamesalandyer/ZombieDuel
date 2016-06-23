//
//  CustomRoundedButton.m
//  ZombieDuel
//
//  Created by James Dyer on 6/23/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "CustomRoundedButton.h"

@implementation CustomRoundedButton

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.cornerRadius = 8.0;
}

@end
