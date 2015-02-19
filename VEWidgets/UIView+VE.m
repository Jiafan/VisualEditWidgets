//
//  UIView+VE.m
//  VisualEditWidgets
//
//  Created by 加帆 on 2/19/15.
//  Copyright (c) 2015 jiafan.net. All rights reserved.
//

#import "UIView+VE.h"

@implementation UIView (VE)
- (UIView *)editingInView
{
    if ([self isKindOfClass:[UITextField class]]) {
        if ([(UITextField *)self isEditing]) {
            return self;
        }else{
            return nil;
        }
    }else{
        if (self.subviews.count>0) {
            for (UIView *v in self.subviews) {
                UIView *e = [v editingInView];
                if (e) {
                    return e;
                }
            }
            return nil;
        }else{
            return nil;
        }
    }
}
- (CGPoint)absolutePosition
{
    CGPoint position = self.frame.origin;
    if (self.superview) {
        CGPoint supPosition = [self.superview absolutePosition];
        position.x += supPosition.x;
        position.y += supPosition.y;
        return position;
    }else{
        return position;
    }
}
@end
