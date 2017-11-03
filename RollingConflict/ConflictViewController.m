//
//  ConflictViewController.m
//  RollingConflict
//
//  Created by apple on 2017/11/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ConflictViewController.h"
// view
#import "ConflictView.h"

@interface ConflictViewController ()

/** view */
@property (strong, nonatomic) ConflictView *conflictView;

@end

@implementation ConflictViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 显示导航栏
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // 布局视图
    [self conflictLayoutView];
}




#pragma mark - 布局视图
- (void)conflictLayoutView {
    self.edgesForExtendedLayout = UIRectEdgeNone;

    
    
    self.conflictView = [[ConflictView alloc] initWithFrame:self.view.frame];
    self.conflictView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.conflictView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
