//
//  ConflictNavView.h
//  RollingConflict
//
//  Created by apple on 2017/11/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


#import <UIKit/UIKit.h>

@interface ConflictNavView : UIView

/** 标题view */
@property (strong, nonatomic) UIView *titleView;
/** 左标题 */
@property (strong, nonatomic) UILabel *leftTitle;
/** 中间标题 */
@property (strong, nonatomic) UILabel *middleTitle;
/** 加号按钮 */
@property (strong, nonatomic) UIButton *addBtn;
/** 搜索框view */
@property (strong, nonatomic) UIView *searchView;

@end
