//
//  CustomAnimatedButton.h
//  ZombieDuel
//
//  Created by James Dyer on 6/23/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAnimatedButton : UIButton
-(void) imageAnimationWithName:(NSString*)name withState:(NSString*)state withImageNumber:(int)imageNumber;
@end
