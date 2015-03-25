//
//  VENavigationController.m
//  VisualEditWidgets
//
//  Created by 加帆 on 3/25/15.
//  Copyright (c) 2015 jiafan.net. All rights reserved.
//

#import "VENavigationController.h"

@interface VENavigationController ()
@property (strong, nonatomic)NSMutableArray *marks;
@end

@implementation VENavigationController
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder]){
        self.marks = [NSMutableArray array];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated marked:(BOOL)marked
{
    [super pushViewController:viewController animated:animated];
    if (marked) {
        [self.marks addObject:viewController];
    }
}
- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    UIViewController *poped = [super popViewControllerAnimated:animated];
    if ([self.marks containsObject:poped]) {
        [self.marks removeObject:poped];
    }
    return poped;
}

- (NSArray *)popToLastMarkedSceneAnimated:(BOOL)animated
{
    return [self popToViewController:[self.marks lastObject]
                            animated:animated];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
