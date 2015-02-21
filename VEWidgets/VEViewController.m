//
//  VEViewController.m
//  VisualEditWidgets
//
//  Created by 加帆 on 2/21/15.
//  Copyright (c) 2015 jiafan.net. All rights reserved.
//

#import "VEViewController.h"
#import "UIView+VE.h"
@interface VEViewController ()<UIGestureRecognizerDelegate,UITextFieldDelegate>
@property(weak, nonatomic)UIScrollView *scollerForEidt;

@end

@implementation VEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBlankAction:)];
    tgr.delegate = self;
    [self.view addGestureRecognizer:tgr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapBlankAction:(UITapGestureRecognizer *)sender
{
    [self.view endEditing:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.editable) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (self.editable && !self.scollerForEidt) {
        UIScrollView *scoller = [[UIScrollView alloc] initWithFrame:self.view.frame];
        scoller.backgroundColor = self.view.backgroundColor;
        [self.view.superview addSubview:scoller];
        self.scollerForEidt = scoller;
        [self.scollerForEidt addSubview:self.view];
    }
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (self.editable) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    }
}
#pragma mark - Keyboard
- (void)keyboardWillShow:(NSNotification *)notification
{
    if (self.editable) {
        CGRect frameKeyboard = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGSize size  = self.view.frame.size;
        size.height += frameKeyboard.size.height;
        self.scollerForEidt.contentSize = size;
        UIView *editingView = [self.view editingInView];
        if (editingView) {
            CGPoint absEditingPosition = [editingView absolutePosition];
            float toScrolle = (absEditingPosition.y + editingView.frame.size.height) - frameKeyboard.origin.y + 40;
            if (toScrolle>0) {
                [self.scollerForEidt setContentOffset:CGPointMake(0, toScrolle) animated:YES];
            }
        }
    }
}
- (void)keyboardWillHide:(NSNotification *)notification
{
    if (self.editable) {
        [UIView animateWithDuration:0.5 animations:^{
            CGSize size  = self.view.frame.size;
            self.scollerForEidt.contentSize = size;
            [self.scollerForEidt scrollsToTop];
        }];
    }
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
