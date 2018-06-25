//
//  TitleLinkView.m
//  TopButtonAddScrollview
//
//  Created by Mac on 2018/6/22.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "TitleLinkView.h"
#import "TitleCollectionViewCell.h"

@interface TitleLinkView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UIView *identifyView;
@property(nonatomic)CGRect identifyViewFrame;

@property(nonatomic,strong)UIView *splitLineView;
@property(nonatomic)NSInteger numberTitles;
@end

@implementation TitleLinkView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 */
-(void)reloadData;{
    [self.collectionView reloadData];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
        [self addSubview:self.splitLineView];
    }
    return self;
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    _collectionView.frame = self.bounds;
    _splitLineView.frame = CGRectMake(0, self.bounds.size.height-1, self.bounds.size.width, 0.5);
    
    CGFloat w = self.titleShowCount == 0 ? 0:self.bounds.size.width / self.titleShowCount;
    _identifyView.frame = CGRectMake(0, self.bounds.size.height-2, w, 1);
    _identifyViewFrame = _identifyView.frame;
}

-(void)setSelectIndex:(NSInteger)selectIndex{
    if (selectIndex != _selectIndex) {
        _selectIndex = selectIndex;
        [self moveToSelectIndex:selectIndex];
        [self.collectionView reloadData];
    }
}

-(void)moveToSelectIndex:(NSInteger)selectIndex{
    NSLog(@" moveToSelectIndex selectIndex %ld",selectIndex);
    if (self.collectionView.visibleCells.count > 0) {
        NSInteger index = -1;
        NSArray *minAndMaxAr = [self minAndMaxInVisibleCells];
        NSInteger minRow = [[minAndMaxAr objectAtIndex:0] integerValue];
        NSInteger maxRow = [[minAndMaxAr objectAtIndex:1] integerValue];
        NSLog(@"minRow %ld ,maxRow.row %ld",minRow,maxRow);
        
        if (selectIndex <= minRow + 1 ) {
            index = selectIndex  - 1;
        }
        
        if (selectIndex >= maxRow) {
            index = selectIndex - self.titleShowCount + 1 + 1;
            if (index + self.titleShowCount > self.numberTitles) {
                index = self.numberTitles - self.titleShowCount;
            };
        }
        
        if (index != -1) {
            NSLog(@" selectIndex + 1 %ld",index);
            CGFloat w = self.titleShowCount == 0 ? 0:self.bounds.size.width / self.titleShowCount;
            [self.collectionView setContentOffset:CGPointMake(w * index, 0) animated:true];
        }
    }
}


-(NSArray*)minAndMaxInVisibleCells{
    NSInteger max = 0;
    NSInteger min = MAXFLOAT;
    for (UICollectionViewCell *cell in self.collectionView.visibleCells) {
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
        if (indexPath.row > max) {
            max = indexPath.row;
        }
        if (indexPath.row < min) {
            min = indexPath.row;
        }
    }
    return @[[NSString stringWithFormat:@"%ld",min],[NSString stringWithFormat:@"%ld",max]];
}

-(void)setTitleShowCount:(NSInteger)titleShowCount{
    if (_titleShowCount != titleShowCount) {
        _titleShowCount = titleShowCount;
        [self.identifyView removeFromSuperview];
        [self.collectionView addSubview:self.identifyView];
        CGFloat w = _titleShowCount == 0 ? 0:self.bounds.size.width / _titleShowCount;
        _identifyView.frame = CGRectMake(0, self.bounds.size.height-1, w, 1);
        _identifyViewFrame = _identifyView.frame;

        NSLog(@"_identifyView.frame %@",NSStringFromCGRect(_identifyView.frame));
    }
}

-(void)setTitleSplitLineColor:(UIColor *)titleSplitLineColor{
    if (![titleSplitLineColor isEqual:_titleSplitLineColor]) {
        _titleSplitLineColor = titleSplitLineColor;
        self.splitLineView.backgroundColor = titleSplitLineColor;
    }
}

-(void)setTitleIdentifyColor:(UIColor *)titleIdentifyColor{
    if (![_titleIdentifyColor isEqual:titleIdentifyColor]) {
        _titleIdentifyColor = titleIdentifyColor;
        _identifyView.backgroundColor = _titleIdentifyColor;
    }
}

-(void)setTitleIdentifyMoveDistance:(CGFloat)titleIdentifyMoveDistance{
    if (_titleIdentifyMoveDistance != titleIdentifyMoveDistance) {
        _titleIdentifyMoveDistance = titleIdentifyMoveDistance;
        CGRect frame = _identifyViewFrame;
        _identifyView.frame = CGRectMake(frame.origin.x + titleIdentifyMoveDistance, frame.origin.y, frame.size.width, frame.size.height);
    }
}

-(UICollectionView*)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator =false;
        _collectionView.showsHorizontalScrollIndicator = false;
        [_collectionView registerClass:[TitleCollectionViewCell class] forCellWithReuseIdentifier:@"TitleCollectionViewCell"];
    }
    return _collectionView;
}

-(UIView*)splitLineView{
    if (_splitLineView == nil) {
        _splitLineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-1, self.bounds.size.width, 0.5)];
        
    }
    return _splitLineView;
}

-(UIView*)identifyView{
    if (_identifyView == nil) {
        CGFloat w = self.titleShowCount == 0 ? 0:self.bounds.size.width / self.titleShowCount;
        _identifyView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-1, w, 1)];
        _identifyViewFrame = _identifyView.frame;
    }
    return _identifyView;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if ([_dataSource respondsToSelector:@selector(numberSectionInTitleLinkView:)]) {
        self.numberTitles = [_dataSource numberSectionInTitleLinkView:self];
        return self.numberTitles;
    }
    return 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;{
    TitleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TitleCollectionViewCell" forIndexPath:indexPath];
    if (self.selectIndex != indexPath.row) {
        cell.titleLabel.textColor = self.titleNomalColor;
    }
    else{
        cell.titleLabel.textColor = self.titleSelectColor;
    }
    
    NSLog(@"title link view");
    
    if ([_dataSource respondsToSelector:@selector(titleLinkView:titleforSection:)]) {
        NSString *title =  [_dataSource titleLinkView:self titleforSection:indexPath.row];
        NSLog(@"title %@",title);
        cell.titleLabel.text = title;
    }

    return cell;
}


#pragma mark UICollectionViewDataSource
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([_delegate respondsToSelector:@selector(titleLinkView:selectIndex:)]) {
        [_delegate titleLinkView:self selectIndex:indexPath.row];
    }
}


#pragma mark UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.titleShowCount == 0) {
        return CGSizeZero;
    }
    return CGSizeMake(self.frame.size.width / self.titleShowCount, self.frame.size.height);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


@end
