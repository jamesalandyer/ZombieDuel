//
//  CustomCircleButton.m
//  ZombieDuel
//
//  Created by James Dyer on 6/24/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import "CustomCircleButton.h"

@implementation CustomCircleButton

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.cornerRadius = self.layer.frame.size.width / 2;
}

@end
