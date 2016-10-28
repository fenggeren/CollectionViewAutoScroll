//
//  MyCollectionViewLayout.h
//  CollectionViewAutoScroll
//
//  Created by Fenggeren on 16/10/28.
//  Copyright © 2016年 Fenggeren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FGRCollectionViewLayout : UICollectionViewFlowLayout

- (CGPoint)contentOffsetWithCellMove:(NSInteger)num;

- (CGFloat)contentOffsetXForProposedOffsetX:(CGFloat)proposedOffsetX;
@end
