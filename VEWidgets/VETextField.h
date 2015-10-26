//
//  VETextField.h
//  VisualEditWidgets
//
//  Created by 加帆 on 2/20/15.
//  Copyright (c) 2015 jiafan.net. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VEShakeDirection) {
    VESD_Horizontal = 0,
    VESD_Vertical
};

typedef NS_OPTIONS(NSUInteger, VEReviewAction){
    VERA_None   = 1<<0,
    VERA_Shake  = 1<<1,
    VERA_Active = 1<<2,
};

#define DefaultSpeed 30
#define ShakeMargin 4

@interface VETextField : UITextField
@property (nonatomic, copy)NSString *regularExpression;
@property (assign, nonatomic) VEShakeDirection direction;
@property (nonatomic, weak)UIImage *icon;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, strong)UIColor *titleColor;
@property (nonatomic, assign)float leftInset;
@property (nonatomic, assign)float leftWidth;
@property (nonatomic, assign)NSUInteger shakeTimes;
@property (nonatomic, assign)float rightInset;
@property (nonatomic, assign)float rightWidth;

- (BOOL)selfReview:(VEReviewAction)options;

@end
