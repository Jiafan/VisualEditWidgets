//
//  VETableView.m
//  VisualEditWidgets
//
//  Created by 加帆 on 3/10/15.
//  Copyright (c) 2015 jiafan.net. All rights reserved.
//

#import "VETableView.h"

@implementation VETableView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        if (!self.tableHeaderView) {
            self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.001)];
        }
    }
    return self;
}

- (void)setHeaderHeight:(CGFloat)headerHeight
{
    UIView *header = self.tableHeaderView;
    CGRect frame = header.frame;
    frame.size.height = headerHeight;
    header.frame = frame;
    self.tableHeaderView = header;
    _headerHeight = headerHeight;
}

- (void)setFooterHeight:(CGFloat)footerHeight
{
    UIView *footer = self.tableFooterView;
    CGRect frame = footer.frame;
    frame.size.height = footerHeight;
    footer.frame = frame;
    self.tableHeaderView = footer;
    _footerHeight = footerHeight;
}

@end
