//
//  VETabBar.m
//  VisualEditWidgets
//
//  Created by 加帆 on 2/22/15.
//  Copyright (c) 2015 jiafan.net. All rights reserved.
//

#import "VETabBar.h"

@implementation VETabBar

- (void)setHidden:(BOOL)hidden{
    if (hidden != self.hidden) {
        CGFloat supHeight = self.superview.bounds.size.height;
        CGRect frame = self.frame;
        frame.origin.y = hidden?supHeight:supHeight-frame.size.height;
        if (hidden) {
            [UIView animateWithDuration:0.5 animations:^{
                self.frame = frame;
            } completion:^(BOOL finished) {
                [super setHidden:hidden];
            }];
        }else{
            [super setHidden:hidden];
            [UIView animateWithDuration:0.5 animations:^{
                self.frame = frame;
            }];
        }
    }else{
        //do nothing
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
