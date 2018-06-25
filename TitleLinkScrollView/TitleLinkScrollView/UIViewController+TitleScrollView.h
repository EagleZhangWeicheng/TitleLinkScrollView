//
//  UIViewController+TitleScrollView.h
//  TopButtonAddScrollview
//
//  Created by Mac on 2018/6/21.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIViewController (TitleScrollView)
@property(nonatomic)BOOL isShowing;//是否正在显示
@property(nonatomic)BOOL isFirstShow;//是否第一次显示

-(void)beginLoadData;
@end
