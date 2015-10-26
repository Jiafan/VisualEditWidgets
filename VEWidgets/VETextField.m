//
//  VETextField.m
//  VisualEditWidgets
//
//  Created by 加帆 on 2/20/15.
//  Copyright (c) 2015 jiafan.net. All rights reserved.
//

#import "VETextField.h"

@interface VETextField()
@property (weak, nonatomic)UIImageView *iconIV;
@property (weak, nonatomic)UILabel *titleLAB;
@end


@implementation VETextField

- (void)setIcon:(UIImage *)icon
{
    if (icon) {
        if (!self.leftView) {
            UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, self.bounds.size.height)];
            self.leftViewMode = UITextFieldViewModeAlways;
            self.leftView = bg;
        }
        CGRect frame = self.leftView.frame;
        if (!self.iconIV) {
            UIImageView *liv = [[UIImageView alloc] initWithFrame:CGRectMake(self.leftView.frame.size.width+0.1*self.bounds.size.height, 0.2*self.bounds.size.height, 0.6*self.bounds.size.height, 0.6*self.bounds.size.height)];
            [self.leftView addSubview:liv];
            self.iconIV = liv;
            frame.size.width += 2*0.1*self.bounds.size.height+liv.frame.size.width;
            self.leftView.frame = frame;
        }
        self.iconIV.image = icon;
        _icon = icon;
    }else if(self.iconIV){
        CGRect frame = self.leftView.frame;
        frame.size.width -= 2*0.1*self.bounds.size.height+self.iconIV.frame.size.width;
        self.leftView.frame = frame;
        self.icon = nil;
        [self.iconIV removeFromSuperview];
        self.iconIV = nil;
    }
}
- (void)setTitle:(NSString *)title
{
    if (title) {
        if (!self.leftView) {
            UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, self.bounds.size.height)];
            self.leftViewMode = UITextFieldViewModeAlways;
            self.leftView = bg;
        }
        CGSize titleSize;
        if ([[[UIDevice currentDevice] systemVersion] floatValue]>7.0) {
            titleSize = [title sizeWithAttributes:@{NSFontAttributeName:self.font}];
        }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            titleSize = [title sizeWithFont:self.font];
#pragma clang diagnostic pop
        }
        
        if (!self.titleLAB) {
            CGRect frame = CGRectMake(0.1*self.bounds.size.height+self.leftView.frame.size.width, 0, titleSize.width, self.frame.size.height);
            UILabel *titleLab = [[UILabel alloc] initWithFrame:frame];
            self.titleLAB = titleLab;
            frame = self.leftView.frame;
            frame.size.width += 0.1*self.bounds.size.height+self.titleLAB.frame.size.width;
            [self.leftView addSubview:self.titleLAB];
            self.leftView.frame = frame;
        }else{
            CGRect frame = CGRectMake(self.leftView.frame.size.width-self.titleLAB.frame.size.width, 0, titleSize.width, self.frame.size.height);
            CGFloat offset = frame.size.width - self.titleLAB.frame.size.width;
            self.titleLAB.frame = frame;
            frame = self.leftView.frame;
            frame.size.width += offset;
            self.leftView.frame = frame;
        }
        self.titleLAB.font = self.font;
        self.titleLAB.text = title;
        _title = title;
    }
}
- (void)setTitleColor:(UIColor *)titleColor
{
    if (titleColor) {
        self.titleLAB.textColor = titleColor;
    }
    _titleColor = titleColor;
}

- (void)setLeftInset:(float)leftInset
{
    if (leftInset) {
        if (self.leftView) {
            for (UIView *view in self.leftView.subviews){
                CGRect frame = view.frame;
                frame.origin.x += leftInset;
                view.frame = frame;
            }
        }else{
            UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leftInset, self.bounds.size.height)];
            self.leftViewMode = UITextFieldViewModeAlways;
            self.leftView = bg;
        }
    }
    _leftInset = leftInset;
}

- (void)setLeftWidth:(float)leftWidth
{
    if (leftWidth) {
        if (self.leftView) {
            CGRect frame = self.leftView.frame;
            frame.size.width = leftWidth;
            self.leftView.frame = frame;
        }else{
            UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leftWidth, self.bounds.size.height)];
            self.leftViewMode = UITextFieldViewModeAlways;
            self.leftView = bg;
        }
    }
    _leftWidth = leftWidth;
}

- (void)setRightInset:(float)rightInset
{
    if (rightInset) {
        if (self.rightView) {
            for (UIView *view in self.rightView.subviews){
                CGRect frame = view.frame;
                frame.origin.x += rightInset;
                view.frame = frame;
            }
        }else{
            UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rightInset, self.bounds.size.height)];
            self.rightViewMode = UITextFieldViewModeAlways;
            self.rightView = bg;
        }
    }
    _rightInset = rightInset;
}

- (void)setRightWidth:(float)rightWidth
{
    if (rightWidth) {
        if (self.rightView) {
            CGRect frame = self.rightView.frame;
            frame.size.width = rightWidth;
            self.rightView.frame = frame;
        }else{
            UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rightWidth, self.bounds.size.height)];
            self.rightViewMode = UITextFieldViewModeAlways;
            self.rightView = bg;
        }
    }
    _rightWidth = rightWidth;
}


- (void)shake:(NSUInteger)times interval:(float)interval margin:(int)margin
{
    --times;
    [UIView animateWithDuration:interval
                     animations:^{
                         int m = margin*(1-2*(times%2));
                         self.transform = (self.direction == VESD_Horizontal)?CGAffineTransformMakeTranslation(m, 0):CGAffineTransformMakeTranslation(0, m);
                     }
                     completion:^(BOOL finished) {
                         if(times) {
                             [self shake:times interval:interval margin:margin];
                         }
                         else {
                             [UIView animateWithDuration:0.5*interval animations:^{
                                 self.transform = CGAffineTransformIdentity;
                             }];
                             return ;
                         }
                     }];
}

- (BOOL)review
{
    if (!self.text || !self.text.length) return NO;
    if (!self.regularExpression && !self.regularExpression.length) return YES;
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:self.regularExpression
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSUInteger matchedNum = [regex numberOfMatchesInString:self.text options:NSMatchingReportProgress range:NSMakeRange(0, self.text.length)];
    return matchedNum>0;
}

- (BOOL)selfReview:(VEReviewAction)options
{
    if([self review]) return YES;
    if (options & VERA_Shake) [self  shake:8 interval:1.0/DefaultSpeed margin:ShakeMargin];
    if (options & VERA_Active) [self becomeFirstResponder];
    return NO;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
