//
//  VETextField.h
//  VisualEditWidgets
//
//  Created by 加帆 on 2/20/15.
//  Copyright (c) 2015 jiafan.net. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ShakeDirection) {
    ShakeDirectionHorizontal = 0,
    ShakeDirectionVertical
};

@interface VETextField : UITextField
@property (nonatomic, copy)NSString *regularExpression;

@property (nonatomic, weak)UIImage *icon;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, strong)UIColor *titleColor;
@property (nonatomic, assign)float leftInset;
@property (nonatomic, assign)float leftWidth;

- (BOOL)selfReview;
- (BOOL)selfReviewAndActive;

@end
