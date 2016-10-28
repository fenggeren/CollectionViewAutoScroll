//
//  MyCollectionViewLayout.m
//  CollectionViewAutoScroll
//
//  Created by Fenggeren on 16/10/28.
//  Copyright © 2016年 Fenggeren. All rights reserved.
//

#import "FGRCollectionViewLayout.h"

@implementation FGRCollectionViewLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGPoint pos = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    
    if (pos.x > self.collectionView.contentOffset.x + self.itemSize.width + self.minimumLineSpacing) {
        // 右移动超过 一cell的距离
        return [self contentOffsetWithCellMove:1];
    } else if (pos.x < self.collectionView.contentOffset.x - self.itemSize.width - self.minimumLineSpacing) {
        // 左移动超过 一cell的距离
        return [self contentOffsetWithCellMove:-1];
    } else {
        return [self contentOffsetWithCellMove:0];
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray<UICollectionViewLayoutAttributes *> * attributes = [super layoutAttributesForElementsInRect:rect];
    CGFloat maxScale = 1.2;
    CGFloat centerX = self.centerX;
    CGFloat maxOffsetX = self.itemSize.width * 0.5 + self.minimumLineSpacing;
    
    for (UICollectionViewLayoutAttributes *attri in attributes) {
        CGFloat offsetX = ABS((attri.center.x - centerX));
        if (offsetX > maxOffsetX) {
            attri.transform = CGAffineTransformIdentity;
        } else {
            CGFloat scale = (maxScale - 1) * (1 - offsetX / maxOffsetX) + 1;
            attri.transform = CGAffineTransformMakeScale(scale, scale);
        }
    }
    return attributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}



#pragma mark - Helper

- (CGPoint)contentOffsetWithCellMove:(NSInteger)num
{
    CGFloat offsetX = [self contentOffsetXForProposedOffsetX:self.collectionView.contentOffset.x];
    
    offsetX += num * (self.itemSize.width + self.minimumLineSpacing);
    
    return CGPointMake(offsetX, self.collectionView.contentOffset.y);
}


- (CGFloat)contentOffsetXForProposedOffsetX:(CGFloat)proposedOffsetX
{
    CGFloat curCenterX = proposedOffsetX + self.collectionView.bounds.size.width * 0.5;
    NSInteger width = curCenterX - self.sectionInset.left;
    CGFloat offset = width % (NSInteger)(self.itemSize.width + self.minimumLineSpacing);
    NSInteger curNum = width / (self.itemSize.width + self.minimumLineSpacing);
    
    CGFloat centerX = 0;
    if (offset == 0) {
        centerX = curCenterX - self.itemSize.width * 0.5 - self.minimumLineSpacing;
    } else {
        centerX = curNum * (self.itemSize.width + self.minimumLineSpacing) + self.sectionInset.left + self.itemSize.width * 0.5;
    }
    return centerX - self.collectionView.bounds.size.width * 0.5;
}

 

- (CGFloat)centerX
{
    return self.collectionView.bounds.size.width * 0.5 + self.collectionView.contentOffset.x;
}
@end
