//
//  ViewController.m
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/10/28.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import "ViewController.h"
#import "FGRCollectionViewLayout.h"
#import "FGRCollectionViewCell.h"
#import "FGRCollectionViewDataSource.h"
#import "MenuDemoViewController.h"


#define kMultiCount 3

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) FGRCollectionViewDataSource  *dataSource;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [[FGRCollectionViewDataSource alloc] init];
    [self.dataSource configCollectionView:self.collectionView];
    
    __weak __typeof(self)weakSelf = self;
    [self.dataSource setDidSelectedCell:^(NSIndexPath *indexPath) {
        MenuDemoViewController *mvc = [[MenuDemoViewController alloc] initWithNibName:@"MenuDemoViewController" bundle:nil];
        [weakSelf.navigationController pushViewController:mvc animated:YES];
    }];
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    FGRCollectionViewLayout *collectionViewLayout = (FGRCollectionViewLayout *)self.collectionView.collectionViewLayout;
    CGSize size = self.collectionView.bounds.size;
    
    collectionViewLayout.itemSize = CGSizeMake(size.width * 0.4, size.height * 0.7);
    collectionViewLayout.minimumLineSpacing = 20;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.dataSource.colors.count inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
    [self.dataSource startAutoScroll];
}


@end













