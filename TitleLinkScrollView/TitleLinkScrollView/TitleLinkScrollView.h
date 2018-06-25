//
//  TitleLinkScrollView.h
//  TopButtonAddScrollview
//
//  Created by Mac on 2018/6/22.
//  Copyright © 2018年 Mac. All rights reserved.
//
#define DefaultTitleShowCount 4
#define DefaultTitleHeight 44

#import <UIKit/UIKit.h>
#import "UIViewController+TitleScrollView.h"
@class TitleLinkScrollView;
@protocol TitleLinkScrollViewDataSource<NSObject>
-(NSInteger)numberSectionInTitleLinkScorllView:(TitleLinkScrollView*)titleScrollView; //所有数量
-(UIViewController*)titleLinkScrollView:(TitleLinkScrollView*)titleLinkScrollView cellforSection:(NSInteger)section;
@optional
-(NSString*)titleLinkScrollView:(TitleLinkScrollView*)titleLinkScrollView titleforSection:(NSInteger)section;

@end

@interface TitleLinkScrollView : UIView
//titleview 开始
@property(nonatomic)BOOL isShowTitleView; //是否显示标题;
@property(nonatomic)CGFloat titleHeight; //默认44
@property(nonatomic)NSInteger titleShowCount; //最大为4
@property(nonatomic,strong)UIColor *titleSelectColor; //选择颜色 默认为255 0 0
@property(nonatomic,strong)UIColor *titleNomalColor; //通常颜色 默认为 51 51 51
@property(nonatomic,strong)UIColor *titleSplitLineColor; //分割线颜色 默认为255 0 0
@property(nonatomic,strong)UIColor *titleIdentifyColor; //指示器颜色 默认为237 237 237
//titleview 结束

@property(nonatomic,weak)id <TitleLinkScrollViewDataSource> dataSource;

-(void)reloadData;


@end
