//
//  TitleCollectionViewCell.m
//  TopButtonAddScrollview
//
//  Created by Mac on 2018/6/21.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "TitleCollectionViewCell.h"

@implementation TitleCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLabel];
        NSLog(@"init frame frame %@",NSStringFromCGRect(frame));
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"init");
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"initWithCoder");
    }
    return self;

}

-(void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"awkenib");
}

-(UILabel*)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
@end
