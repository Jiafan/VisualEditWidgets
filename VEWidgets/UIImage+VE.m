//
//  UIImage+VE.m
//  VisualEditWidgets
//
//  Created by 加帆 on 2/23/15.
//  Copyright (c) 2015 jiafan.net. All rights reserved.
//

#import "UIImage+VE.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>
@implementation UIImage (VE)
- (UIImage *)blurWith:(CGFloat)degree
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [[CIImage alloc] initWithImage:self];
    // create gaussian blur filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSDecimalNumber numberWithFloat:degree] forKey:@"inputRadius"];
    // blur image
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return image;
}
@end