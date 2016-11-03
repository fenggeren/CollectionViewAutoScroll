//
//  FGRReadOptionViewController.m
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import "FGRReadOptionViewController.h"
#import "FGRReadOptionItem.h"
#import "FGRReadOptionCell.h"
#import "FGRReadOptionFontSizeCell.h"
#import "FGRReadOptionConfigController.h"
#import "FGROptionManager.h"
#import "FGRReadOptionNavigationController.h"

@interface FGRReadOptionViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<FGRReadOptionItem *> *items;
@end

@implementation FGRReadOptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor clearColor];
    
    
    [self configItems];
    [self configTableView];
}

- (void)configItems
{ 
    self.items = @[
                   [FGRReadOptionItem itemWith:@"字号" iconName:nil optionType:FGRReadOptionTypeFontSize],
                   [FGRReadOptionItem itemWith:@"行距" iconName:nil optionType:FGRReadOptionTypeLineSpace],
                   [FGRReadOptionItem itemWith:@"翻页样式" iconName:nil optionType:FGRReadOptionTypeFlipStyle],
                   [FGRReadOptionItem itemWith:@"字体" iconName:nil optionType:FGRReadOptionTypeFontStyle],
                   [FGRReadOptionItem itemWith:@"繁简切换" iconName:nil optionType:FGRReadOptionTypeLanguage]];
}

- (void)configTableView
{
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    table.scrollEnabled = NO;
    table.delegate = self;
    table.dataSource = self;
    table.rowHeight = 55;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    table.backgroundColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.6];
    [self.view addSubview:table];
    self.tableView = table;
    [table registerNib:[UINib nibWithNibName:@"FGRReadOptionCell" bundle:nil] forCellReuseIdentifier:@"FGRReadOptionCell"];
    [table registerNib:[UINib nibWithNibName:@"FGRReadOptionFontSizeCell" bundle:nil] forCellReuseIdentifier:@"FGRReadOptionFontSizeCell"];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat height = self.items.count * self.tableView.rowHeight;
    self.tableView.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds) - height, CGRectGetWidth(self.view.bounds), height);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:UINavigationControllerHideShowBarDuration animations:^{
        CGRect frame = self.tableView.frame;
        frame.origin = CGPointMake(0, self.view.bounds.size.height);
        self.tableView.frame = frame;
    } completion:^(BOOL finished) {
        [self.navigationController.view removeFromSuperview];
        [self.navigationController removeFromParentViewController];
    }];
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = nil;
    if (indexPath.row == 0) {
        identifier = @"FGRReadOptionFontSizeCell";
    } else {
        identifier = @"FGRReadOptionCell";
    }
    UITableViewCell<FGRReadOptionItem> *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.item = self.items[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) { return; }
    if (indexPath.row == self.items.count - 1) {
        NSInteger oldIndex = [FGROptionManager sharedInstance].languagesIndex;
        [FGROptionManager sharedInstance].languagesIndex = !oldIndex;
        [self.tableView reloadRowsAtIndexPaths:@[[indexPath copy]] withRowAnimation:UITableViewRowAnimationNone];
        return;
    }
    
    FGRReadOptionConfigController *config = [[FGRReadOptionConfigController alloc] initWithNibName:@"FGRReadOptionConfigController" bundle:nil];
    config.optionType = indexPath.row;
    config.navTitle = self.items[indexPath.row].name;
    __weak __typeof(self)weakSelf = self;
    config.returnBlock = ^{
        [weakSelf.tableView reloadRowsAtIndexPaths:@[[indexPath copy]] withRowAnimation:UITableViewRowAnimationNone];
    };
    [self.navigationController pushViewController:config animated:NO];
}

@end

















