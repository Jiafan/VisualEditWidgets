//
//  HomeScene.m
//  VisualEditWidgets
//
//  Created by 加帆 on 2/24/15.
//  Copyright (c) 2015 jiafan.net. All rights reserved.
//

#import "HomeScene.h"
#import "UIImageView+VE.h"
#import "VETextField.h"
@interface HomeScene ()
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet VETextField *phoneTF;
- (IBAction)goAction:(UIButton *)sender;
- (IBAction)hideTabBarAction:(id)sender;

@end

@implementation HomeScene
- (IBAction)configTabBar:(UIButton *)sender {
    self.tabBarController.tabBar.hidden = !self.tabBarController.tabBar.hidden;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goAction:(UIButton *)sender {
//    [self.img blurWith:5];
    
    [self.phoneTF selfReview:VERA_Shake|VERA_Active];
}

- (IBAction)hideTabBarAction:(id)sender {
    self.tabBarController.tabBar.hidden = YES;
}
@end
