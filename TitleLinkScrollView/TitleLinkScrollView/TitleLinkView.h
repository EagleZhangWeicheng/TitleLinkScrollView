//
//  TitleLinkView.h
//  TopButtonAddScrollview
//
//  Created by Mac on 2018/6/22.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TitleLinkView;
@protocol TitleLinkViewDelegate <NSObject>
@optional
-(void)titleLinkView:(TitleLinkView*)titleLinkView selectIndex:(NSInteger)index;
@end

@protocol TitleLinkViewDataSource <NSObject>
-(NSInteger)numberSectionInTitleLinkView:(TitleLinkView*)titleLinkView; //所有数量
-(NSString*)titleLinkView:(TitleLinkView*)titleLinkView titleforSection:(NSInteger)section;
@end

@interface TitleLinkView : UIView

@property(nonatomic)NSInteger titleShowCount; //最大为4
@property(nonatomic,strong)UIColor *titleSelectColor; //选择颜色
@property(nonatomic,strong)UIColor *titleNomalColor; //通常颜色
@property(nonatomic,strong)UIColor *titleSplitLineColor; //分割线颜色 默认为255 0 0
@property(nonatomic,strong)UIColor *titleIdentifyColor; //指示器颜色 默认为255 0 0
@property(nonatomic)CGFloat titleIdentifyMoveDistance; //指示移动距离

@property(nonatomic)NSInteger selectIndex; //选择的第一个
@property(nonatomic,weak)id <TitleLinkViewDelegate>delegate;
@property(nonatomic,weak)id <TitleLinkViewDataSource>dataSource;

-(void)reloadData;
@end
