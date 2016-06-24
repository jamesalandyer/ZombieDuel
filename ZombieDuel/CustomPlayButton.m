//
//  CustomPlayButton.m
//  ZombieDuel
//
//  Created by James Dyer on 6/23/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "CustomPlayButton.h"

@implementation CustomPlayButton

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.cornerRadius = self.layer.frame.size.width / 2;
    self.layer.borderColor = [UIColor colorWithRed: 171.0 / 255.0 green: 214.0 / 255.0 blue: 254.0 / 255.0 alpha: 1.0].CGColor;
    self.layer.borderWidth = 5.0;
}

@end
