//
//  MyCollectionViewCell.m
//  CollectionViewAutoScroll
//
//  Created by Fenggeren on 16/10/28.
//  Copyright © 2016年 Fenggeren. All rights reserved.
//

#import "FGRCollectionViewCell.h"

@implementation FGRCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    UICollectionViewLayoutAttributes *attri = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    CGRect frame = attri.frame;
    frame.origin.y = 0;
    attri.frame = frame; 
    return attri;
}

@end
