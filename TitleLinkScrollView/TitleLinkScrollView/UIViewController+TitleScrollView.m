//
//  UIViewController+TitleScrollView.m
//  TopButtonAddScrollview
//
//  Created by Mac on 2018/6/21.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "UIViewController+TitleScrollView.h"

@implementation UIViewController (TitleScrollView)

-(BOOL)isShowing{
    return [objc_getAssociatedObject(self, @"isShowing") boolValue];
}

-(void)setIsShowing:(BOOL)isShowing{
    objc_setAssociatedObject(self,
                             @"isShowing",
                             [NSString stringWithFormat:@"%d",isShowing], OBJC_ASSOCIATION_COPY_NONATOMIC);
}


-(void)setIsFirstShow:(BOOL)isFirstShow{
    if (isFirstShow) {
        [self beginLoadData];
    }

    objc_setAssociatedObject(self,
                             @"isFirstShow",
                             [NSString stringWithFormat:@"%d",isFirstShow], OBJC_ASSOCIATION_COPY_NONATOMIC);
}


-(BOOL)isFirstShow{
    return [objc_getAssociatedObject(self, @"isFirstShow") boolValue];
}

-(void)beginLoadData;{
    
}

@end
