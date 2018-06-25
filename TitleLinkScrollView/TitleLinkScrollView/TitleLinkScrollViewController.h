//
//  TitleLinkScrollViewController.h
//  TopButtonAddScrollview
//
//  Created by Mac on 2018/6/22.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleLinkScrollView.h"

@interface TitleLinkScrollViewController : UIViewController
@property(nonatomic,strong)TitleLinkScrollView *titleLinkScrollView;
@property(nonatomic)CGFloat titleHeight; //默认44
@property(nonatomic)NSInteger titleShowCount; //最大为4
@property(nonatomic,strong)UIColor *titleSelectColor; //选择颜色 默认为255 0 0
@property(nonatomic,strong)UIColor *titleNomalColor; //通常颜色 默认为 51 51 51
@property(nonatomic,strong)UIColor *titleSplitLineColor; //分割线颜色 默认为255 0 0
@property(nonatomic,strong)UIColor *titleIdentifyColor; //指示器颜色 默认为237 237 237
@end
