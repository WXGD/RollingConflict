//
//  ConflictView.m
//  RollingConflict
//
//  Created by apple on 2017/11/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ConflictView.h"
#import "MJRefresh.h"

@interface ConflictView ()<UIScrollViewDelegate>

// 主Scroll
@property (strong, nonatomic) UIScrollView *mainScroll;
// 导航栏
@property (strong, nonatomic) ConflictNavView *conflictNavView;
// 副Scroll
@property (strong, nonatomic) UIScrollView *viceScroll;

@end

@implementation ConflictView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self conflictLayoutView];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self conflictLayoutView];
    }
    return self;
}

#pragma makr - scroll代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    
    CGFloat y = scrollView.contentOffset.y;
    if (y <= 0) {

        self.conflictNavView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 110);
        
//        CGRect newFrame = self.conflictNavView.frame;
//        newFrame.origin.y = y;
//        newFrame.size.height = 110;
//        self.conflictNavView.frame = newFrame;
        
//        newFrame = self.viceScroll.frame;
//        newFrame.origin.y = y + 310;
//        self.viceScroll.frame = newFrame;
        
        
        
        self.viceScroll.contentOffset = CGPointMake(0, y);

    } else if (y <= 47) {
        self.conflictNavView.titleView.alpha = 1 - self.mainScroll.contentOffset.y / 30;
        
        
        CGRect newFrame = CGRectMake(10, 74, SCREEN_WIDTH - 20, 30);
        newFrame.origin.y = newFrame.origin.y - y;
        newFrame.size.width = newFrame.size.width - y;
        self.conflictNavView.searchView.frame = newFrame;
//        self.conflictNavView.searchView.frame = CGRectMake(10, 74 - self.mainScroll.contentOffset.y - 20, SCREEN_WIDTH - 40 - self.mainScroll.contentOffset.y, 30);
        
        NSLog(@"searchView===%f", self.conflictNavView.searchView.frame.origin.y);
        NSLog(@"y===%f", y);

        
        
        self.conflictNavView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 110 - self.mainScroll.contentOffset.y - 20);

        
    }else {
        
    }
  
//    NSLog(@"%f", y);
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    // 松手时判断是否刷新
    CGFloat y = scrollView.contentOffset.y;
    if (y < - 65) {
        [self.viceScroll.mj_header beginRefreshing];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.viceScroll.mj_header endRefreshing];
        });
    }
}



#pragma makr - 创建控件
- (void)conflictLayoutView {
    // 主Scroll
    self.mainScroll = [[UIScrollView alloc] init];
    self.mainScroll.contentSize = CGSizeMake(SCREEN_WIDTH, 1000);
    self.mainScroll.delegate = self;
    self.mainScroll.backgroundColor = [UIColor greenColor];
    self.mainScroll.scrollIndicatorInsets = UIEdgeInsetsMake(130, 0, 0, 0);
    [self addSubview:self.mainScroll];
    // 导航栏
    self.conflictNavView = [[ConflictNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 110)];
    [self addSubview:self.conflictNavView];
    // 副Scroll
    self.viceScroll = [[UIScrollView alloc] init];
    self.viceScroll.delegate = self;
    self.viceScroll.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 230);
    self.viceScroll.backgroundColor = [UIColor yellowColor];
    [self.mainScroll addSubview:self.viceScroll];
    self.viceScroll.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:nil];

}



#pragma makr - 布局方法
- (void)layoutSubviews {
    [super layoutSubviews];
    // 主Scroll
    self.mainScroll.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    // 导航栏
//    self.conflictNavView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 110);
    
    // 副Scroll
    self.viceScroll.frame = CGRectMake(0, 130, SCREEN_WIDTH, SCREEN_HEIGHT - 230);

}


@end
