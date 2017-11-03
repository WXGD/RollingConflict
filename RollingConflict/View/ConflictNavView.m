//
//  ConflictNavView.m
//  RollingConflict
//
//  Created by apple on 2017/11/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ConflictNavView.h"

@interface ConflictNavView ()



@end

@implementation ConflictNavView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        [self conflictNavLayoutView];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        [self conflictNavLayoutView];
    }
    return self;
}

#pragma makr - 创建控件
- (void)conflictNavLayoutView {
    /** 标题view */
    self.titleView = [[UIView alloc] init];
    self.titleView.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.titleView];
    /** 左标题 */
    self.leftTitle = [[UILabel alloc] init];
    self.leftTitle.text = @"左标题";
    self.leftTitle.textColor = [UIColor whiteColor];
    [self.titleView addSubview:self.leftTitle];
    /** 中间标题 */
    self.middleTitle = [[UILabel alloc] init];
    self.middleTitle.text = @"中间标题";
    self.middleTitle.textColor = [UIColor whiteColor];
    [self.titleView addSubview:self.middleTitle];
    /** 加号按钮 */
    self.addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addBtn.backgroundColor = [UIColor greenColor];
    [self.addBtn setTitle:@"+" forState:UIControlStateNormal];
    [self.addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:self.addBtn];
    /** 搜索框view */
    self.searchView = [[UIView alloc] initWithFrame:CGRectMake(10, 74, SCREEN_WIDTH - 20, 30)];
    self.searchView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.searchView];
}



#pragma makr - 布局方法
- (void)layoutSubviews {
    [super layoutSubviews];
    /** 标题view */
    self.titleView.frame = CGRectMake(0, 20, SCREEN_WIDTH - 44, 44);
    /** 左标题 */
    self.leftTitle.frame = CGRectMake(0, 0, 60, 44);
    /** 中间标题 */
    self.middleTitle.frame = CGRectMake(CGRectGetMidX(self.titleView.frame), 0, 100, 44);
    /** 加号按钮 */
    self.addBtn.frame = CGRectMake(self.titleView.frame.size.width, 20, 44, 44);
    /** 搜索框view */
//    self.searchView.frame = CGRectMake(10, CGRectGetMaxY(self.titleView.frame) + 10, SCREEN_WIDTH - 20, 30);
}


@end
