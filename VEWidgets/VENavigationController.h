//
//  VENavigationController.h
//  VisualEditWidgets
//
//  Created by 加帆 on 3/25/15.
//  Copyright (c) 2015 jiafan.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VENavigationController : UINavigationController
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated marked:(BOOL)marked;
- (NSArray *)popToLastMarkedSceneAnimated:(BOOL)animated;
@end
