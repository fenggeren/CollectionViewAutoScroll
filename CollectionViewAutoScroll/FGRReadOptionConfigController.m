//
//  FGRReadOptionConfigController.m
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import "FGRReadOptionConfigController.h"
#import "FGRReadOptionItem.h"
#import "FGRReadOptionCell.h"
#import "FGRReadOptionNaviCell.h"
#import "FGROptionManager.h"
#import "FGRReadOptionNaviView.h"
#import "FGROptionManager.h"

@interface FGRReadOptionConfigController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) FGRReadOptionNaviView *naviView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FGRReadOptionConfigController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor clearColor];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.rowHeight = 55;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    table.backgroundColor = [UIColor clearColor];
    self.tableView = table;
    [table registerNib:[UINib nibWithNibName:@"FGRReadOptionCell" bundle:nil] forCellReuseIdentifier:@"FGRReadOptionCell"];
    [table registerNib:[UINib nibWithNibName:@"FGRReadOptionNaviCell" bundle:nil] forCellReuseIdentifier:@"FGRReadOptionNaviCell"];
    
    FGRReadOptionNaviView *naviView = [FGRReadOptionNaviView nibView];
    naviView.lblTitle.text = self.navTitle;
    naviView.backgroundColor = [UIColor clearColor];
    [naviView.btnReturn addTarget:self action:@selector(clkPopReturn) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *containerView = [[UIView alloc] init];
    containerView.backgroundColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.6];
    [self.view addSubview:containerView];
    
    [containerView addSubview:naviView];
    [containerView addSubview:table];
    
    self.naviView = naviView;
    self.containerView = containerView;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat containerHeight = (self.names.count + 1) * self.tableView.rowHeight;
    self.containerView.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds) - containerHeight,
                                          CGRectGetWidth(self.view.bounds), containerHeight);
    self.naviView.frame = CGRectMake(0, 0, CGRectGetWidth(self.containerView.bounds),
                                     self.tableView.rowHeight);
    
    CGFloat tableHeight = self.names.count * self.tableView.rowHeight;
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.naviView.frame),
                                      CGRectGetWidth(self.containerView.bounds), tableHeight);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:UINavigationControllerHideShowBarDuration animations:^{
        CGRect frame = self.containerView.frame;
        frame.origin = CGPointMake(0, self.view.bounds.size.height);
        self.containerView.frame = frame;
    } completion:^(BOOL finished) {
        [self.navigationController.view removeFromSuperview];
        [self.navigationController removeFromParentViewController];
    }];
}
 
#pragma mark -

- (void)clkPopReturn
{
    if (self.returnBlock) {
        self.returnBlock();
        self.returnBlock = nil;
    }
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)setOptionType:(FGRReadOptionType)optionType
{
    _optionType = optionType;
    self.names = [[FGROptionManager sharedInstance] keysWith:optionType];
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.names.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FGRReadOptionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FGRReadOptionCell" forIndexPath:indexPath];
    cell.lblName.text = self.names[indexPath.row];
    if ([[FGROptionManager sharedInstance] selectIndexWith:self.optionType] == indexPath.row) {
        cell.iconImage.hidden = NO;
    } else {
        cell.iconImage.hidden = YES;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger oldIndex = [[FGROptionManager sharedInstance] selectIndexWith:self.optionType];
    if (indexPath.row == oldIndex) {
        return;
    }
    
#define kReadOptionConfigNoti @"kReadOptionConfigNoti"
    [[NSNotificationCenter defaultCenter] postNotificationName:kReadOptionConfigNoti object:self userInfo:@{@"type": @(self.optionType), @"index": @(indexPath.row)}];
    [[FGROptionManager sharedInstance] setSelectIndex:indexPath.row forType:self.optionType];
    
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:oldIndex inSection:0],
                                             [indexPath copy]]
                          withRowAnimation:UITableViewRowAnimationNone];
}


@end







