//
//  ViewController.m
//  RollingConflict
//
//  Created by apple on 2017/11/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "ConflictViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 40);
    [btn setTitle:@"调整" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)btnAction:(UIButton *)button {
    ConflictViewController *conflictVC = [[ConflictViewController alloc] init];
    [self.navigationController pushViewController:conflictVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
