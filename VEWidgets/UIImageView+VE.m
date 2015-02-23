//
//  UIImageView+VE.m
//  VisualEditWidgets
//
//  Created by 加帆 on 2/23/15.
//  Copyright (c) 2015 jiafan.net. All rights reserved.
//

#import "UIImageView+VE.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+VE.h"
@implementation UIImageView (VE)
- (void)blurWith:(CGFloat)degree
{
    UIGraphicsBeginImageContext(self.frame.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.image = [img blurWith:0.1];
}
@end
