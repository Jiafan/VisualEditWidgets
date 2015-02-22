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
        __block CGRect frame = self.frame;
        float offset = (hidden?1:-1)*frame.size.height;
        if (hidden) {
            [UIView animateWithDuration:0.5 animations:^{
                frame.origin.y += offset;
                self.frame = frame;
            } completion:^(BOOL finished) {
                [super setHidden:hidden];
            }];
        }else{
            [super setHidden:hidden];
            [UIView animateWithDuration:0.5 animations:^{
                frame.origin.y += offset;
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
