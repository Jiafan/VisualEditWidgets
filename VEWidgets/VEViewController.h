//
//  VEViewController.h
//  VisualEditWidgets
//
//  Created by 加帆 on 2/21/15.
//  Copyright (c) 2015 jiafan.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VEViewController : UIViewController
@property (assign, nonatomic)BOOL editable;

- (void)tapBlankAction:(UITapGestureRecognizer *)sender;
@end
