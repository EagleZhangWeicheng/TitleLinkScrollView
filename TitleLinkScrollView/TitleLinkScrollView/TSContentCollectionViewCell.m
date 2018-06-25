//
//  TSContentCollectionViewCell.m
//  TopButtonAddScrollview
//
//  Created by Mac on 2018/6/21.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "TSContentCollectionViewCell.h"

@implementation TSContentCollectionViewCell
-(void)setContentContoller:(UIViewController *)contentContoller{
    if (![_contentContoller isEqual:contentContoller]) {
        [_contentContoller.view removeFromSuperview];
        _contentContoller = contentContoller;
        _contentContoller.view.frame = self.bounds;
        [self addSubview:contentContoller.view];
    }
}
@end
