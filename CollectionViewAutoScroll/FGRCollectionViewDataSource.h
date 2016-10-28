//
//  MyCollectionViewDataSource.h
//  CollectionViewAutoScroll
//
//  Created by Fenggeren on 16/10/28.
//  Copyright © 2016年 Fenggeren. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FGRCollectionViewLayout;

@interface FGRCollectionViewDataSource : NSObject<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>


- (void)configCollectionView:(UICollectionView *)collectionView;


- (void)defaultSetLayout;

@property (nonatomic, strong, readonly) FGRCollectionViewLayout *collectionViewLayout;

@property (nonatomic, strong) NSArray *colors;

@property (nonatomic, copy) void(^didSelectedCell)(NSIndexPath *indexPath);

@end
