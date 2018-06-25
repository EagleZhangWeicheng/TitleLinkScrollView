//
//  TitleLinkScrollView.m
//  TopButtonAddScrollview
//
//  Created by Mac on 2018/6/22.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "TitleLinkScrollView.h"
#import "TSContentCollectionViewCell.h"
#import "TitleLinkView.h"


@interface TitleLinkScrollView ()<UIScrollViewDelegate,TitleLinkViewDelegate,TitleLinkViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)TitleLinkView *titleLinkView;


@property(nonatomic,strong)UICollectionView *contentCollectionView;

@property(nonatomic)NSInteger selectIndex;//选择的
@end

@implementation TitleLinkScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)reloadData;{
    [self.contentCollectionView reloadData];
    [self.titleLinkView reloadData];
}

-(instancetype)initWithFrame:(CGRect)frame;{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSet];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initSet];
    }
    return self;
}


-(void)initSet{
    self.titleHeight = DefaultTitleHeight;
    self.titleShowCount = DefaultTitleShowCount;
    self.titleNomalColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/225.0 alpha:1];
    self.titleSelectColor = [UIColor colorWithRed:255/255.0 green:0 blue:0 alpha:1];
    
    self.titleSplitLineColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/225.0 alpha:1];
    self.titleIdentifyColor = [UIColor colorWithRed:255/255.0 green:0 blue:0 alpha:1];
    
    _selectIndex = -1;
    
//    self.titleLinkView.titleNomalColor = self.titleNomalColor;
    self.titleLinkView.titleSelectColor = self.titleSelectColor;
    self.titleLinkView.titleIdentifyColor  = self.titleIdentifyColor;
    self.titleLinkView.titleSplitLineColor = self.titleSplitLineColor;
    
    [self addSubview:self.titleLinkView];
    [self addSubview:self.contentCollectionView];
}

-(void)setTitleShowCount:(NSInteger)titleShowCount{
    if (_titleShowCount != titleShowCount) {
        _titleShowCount = titleShowCount;
        self.titleLinkView.titleShowCount = self.titleShowCount;
    }
}

-(void)setTitleHeight:(CGFloat)titleHeight{
    if (titleHeight == 0) {
        return;
    }
    if (_titleHeight != titleHeight) {
        _titleHeight = titleHeight;
        if (_titleHeight != DefaultTitleHeight) {
            [self resetTitleHeight];
            
        }
    }
}

-(void)resetTitleHeight{
    _titleLinkView.frame = CGRectMake(0, 0, self.frame.size.width,self.titleHeight);
    CGRect frame = CGRectMake(0,self.titleHeight,self.frame.size.width,self.frame.size.height - self.titleHeight);
    _contentCollectionView.frame = frame;
    [self reloadData];
}

-(void)setTitleNomalColor:(UIColor *)titleNomalColor{
    if (![titleNomalColor isEqual:_titleNomalColor]) {
        _titleNomalColor = titleNomalColor;
        self.titleLinkView.titleNomalColor = _titleNomalColor;
        [self.titleLinkView reloadData];
    }
}

-(void)setTitleSelectColor:(UIColor *)titleSelectColor{
    if (![_titleSelectColor isEqual:titleSelectColor]) {
        _titleSelectColor = titleSelectColor;
        self.titleLinkView.titleSelectColor = _titleSelectColor;
        [self.titleLinkView reloadData];
    }
}

-(void)setTitleIdentifyColor:(UIColor *)titleIdentifyColor{
    if (![_titleIdentifyColor isEqual:titleIdentifyColor]) {
        _titleIdentifyColor = titleIdentifyColor;
        self.titleLinkView.titleIdentifyColor = titleIdentifyColor;
    }
}

-(void)setTitleSplitLineColor:(UIColor *)titleSplitLineColor{
    if (![_titleSplitLineColor isEqual:titleSplitLineColor]) {
        _titleSplitLineColor = titleSplitLineColor;
        self.titleLinkView.titleSplitLineColor = titleSplitLineColor;
    }
}


-(UIView*)titleLinkView{
    if (_titleLinkView == nil) {
        _titleLinkView = [[TitleLinkView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width,self.titleHeight)];
        _titleLinkView.delegate = self;
        _titleLinkView.dataSource = self;
        _titleLinkView.backgroundColor = [UIColor blueColor];
    }
    
    return _titleLinkView;
}


-(UICollectionView*)contentCollectionView{
    if (_contentCollectionView == nil) {
        CGRect frame = CGRectMake(0,self.titleHeight,self.frame.size.width,self.frame.size.height - self.titleHeight);
        UICollectionViewFlowLayout  *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _contentCollectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];;
        [_contentCollectionView registerClass:[TSContentCollectionViewCell class] forCellWithReuseIdentifier:@"TSContentCollectionViewCell"];
        _contentCollectionView.pagingEnabled = true;
        _contentCollectionView.backgroundColor = [UIColor whiteColor];
        _contentCollectionView.showsVerticalScrollIndicator =false;
        _contentCollectionView.showsHorizontalScrollIndicator = false;
        _contentCollectionView.delegate = self;
        _contentCollectionView.dataSource = self;
    }

    return _contentCollectionView;
}


-(void)setSelectIndex:(NSInteger)selectIndex{
    if (_selectIndex != selectIndex) {
        _selectIndex = selectIndex;
    }
}


#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;{
    if ([_dataSource respondsToSelector:@selector(numberSectionInTitleLinkScorllView:)]) {
       return [_dataSource numberSectionInTitleLinkScorllView:self];
    }
    return 0;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;{
    TSContentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TSContentCollectionViewCell" forIndexPath:indexPath];
    if ([_dataSource respondsToSelector:@selector(titleLinkScrollView:cellforSection:)]) {
        UIViewController *temp = [_dataSource titleLinkScrollView:self cellforSection:indexPath.row];
        cell.contentContoller = temp;
    }
    return cell;
}

#pragma mark UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = self.contentCollectionView.bounds.size;
    return CGSizeMake(size.width, size.height);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;{
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;{
    return CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;{
    return UIEdgeInsetsZero;
}



#pragma mark UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / self.contentCollectionView.bounds.size.width;
    self.titleLinkView.titleIdentifyMoveDistance = scrollView.contentOffset.x/ self.titleShowCount;
    if (self.titleLinkView.selectIndex != index) {
        self.titleLinkView.selectIndex = index;
        self.selectIndex = index;
    }
}


#pragma mark TitleLinkViewDelegate
-(void)titleLinkView:(TitleLinkView *)titleLinkView selectIndex:(NSInteger)index{
    [self.contentCollectionView setContentOffset:CGPointMake(index * self.contentCollectionView.bounds.size.width, 0) animated:true];
}

#pragma mark TitleLinkViewDataSource
-(NSInteger)numberSectionInTitleLinkView:(TitleLinkView*)titleLinkView; //所有数量
{
    if ([_dataSource respondsToSelector:@selector(numberSectionInTitleLinkScorllView:)]) {
        return [_dataSource numberSectionInTitleLinkScorllView:self];
    }
    return 0;
}
-(NSString*)titleLinkView:(TitleLinkView*)titleLinkView titleforSection:(NSInteger)section;
{
    if ([_dataSource respondsToSelector:@selector(titleLinkScrollView:titleforSection:)]) {
       return [_dataSource titleLinkScrollView:self titleforSection:section];
    }
    return nil;
}


@end
