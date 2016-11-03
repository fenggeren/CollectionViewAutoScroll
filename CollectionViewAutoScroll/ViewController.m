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

@property (weak, nonatomic) IBOutlet UILabel *lblFont;

@property (weak, nonatomic) IBOutlet UILabel *lblFont2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.dataSource = [[FGRCollectionViewDataSource alloc] init];
    [self.dataSource configCollectionView:self.collectionView];
    
    __weak __typeof(self)weakSelf = self;
    [self.dataSource setDidSelectedCell:^(NSIndexPath *indexPath) {
        MenuDemoViewController *mvc = [[MenuDemoViewController alloc] initWithNibName:@"MenuDemoViewController" bundle:nil];
        [weakSelf.navigationController pushViewController:mvc animated:YES];
    }];
    
    
    // Yuppy SC  Wawati SC
    self.lblFont.font = [UIFont fontWithName:@"PingFang SC" size:25];
    
    self.lblFont2.font = [UIFont systemFontOfSize:25];
    
    NSArray *names = [UIFont familyNames];
    NSLog(@"%@", names);
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













