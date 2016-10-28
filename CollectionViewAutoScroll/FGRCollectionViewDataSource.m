//
//  FGRCollectionViewDataSource.m
//  CollectionViewAutoScroll
//
//  Created by Fenggeren on 16/10/28.
//  Copyright © 2016年 Fenggeren. All rights reserved.
//

#import "FGRCollectionViewDataSource.h"
#import "FGRCollectionViewCell.h"
#import "FGRCollectionViewLayout.h"

#define kMultiCount 3

@interface FGRCollectionViewDataSource()
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation FGRCollectionViewDataSource
{
    FGRCollectionViewLayout * _collectionViewLayout;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.colors = @[ [UIColor redColor], [UIColor blueColor], [UIColor greenColor],
                         [UIColor grayColor], [UIColor cyanColor], [UIColor yellowColor],
                         [UIColor magentaColor], [UIColor orangeColor], [UIColor purpleColor]];
    }
    return self;
}

- (void)configCollectionView:(UICollectionView *)collectionView
{
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"FGRCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FGRCollectionViewCell"];
    collectionView.collectionViewLayout = self.collectionViewLayout;
    _collectionView = collectionView;
}

- (void)defaultSetLayout
{
    FGRCollectionViewLayout *collectionViewLayout = (FGRCollectionViewLayout *)self.collectionView.collectionViewLayout;
    CGSize size = self.collectionView.bounds.size;
    collectionViewLayout.itemSize = CGSizeMake(size.width * 0.4, size.height * 0.7);
    collectionViewLayout.minimumLineSpacing = 20;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
}

- (FGRCollectionViewLayout *)collectionViewLayout
{
    if (!_collectionViewLayout) {
        _collectionViewLayout = [[FGRCollectionViewLayout alloc] init];
        _collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _collectionViewLayout;
}

#pragma mark -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.colors.count * kMultiCount;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FGRCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FGRCollectionViewCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = self.colors[indexPath.item % self.colors.count];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    if (self.didSelectedCell) {
        self.didSelectedCell([indexPath copy]);
    }
    collectionView.userInteractionEnabled = NO;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    CGFloat centerX = scrollView.contentOffset.x + scrollView.bounds.size.width * 0.5;
    CGFloat offsetX = [self scrollView:scrollView targetContentOffsetXWithProposedCenterX:centerX];
    [scrollView setContentOffset:CGPointMake(offsetX, scrollView.contentOffset.y) animated:NO];
    scrollView.userInteractionEnabled = YES;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat centerX = scrollView.contentOffset.x + scrollView.bounds.size.width * 0.5;
    CGFloat offsetX = [self scrollView:scrollView targetContentOffsetXWithProposedCenterX:centerX];
    
    [scrollView setContentOffset:CGPointMake(offsetX, scrollView.contentOffset.y) animated:NO];
}

- (CGFloat)scrollView:(UIScrollView *)scrollView targetContentOffsetXWithProposedCenterX:(CGFloat)proposedCenterX
{
    NSInteger one_3 = scrollView.contentSize.width / 3;
    if (proposedCenterX < one_3) {
        proposedCenterX += one_3;
    } else if (proposedCenterX > one_3 * 2) {
        proposedCenterX -= one_3;
    }
    return [self.collectionViewLayout contentOffsetXForProposedOffsetX:proposedCenterX - scrollView.bounds.size.width * 0.5];
}


@end











