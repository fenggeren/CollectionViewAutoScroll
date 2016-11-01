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
@interface FGRReadOptionViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<FGRReadOptionItem *> *items;
@end

@implementation FGRReadOptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor clearColor];

    self.items = @[[FGRReadOptionItem itemWith:@"字号" iconName:nil info:@"大"],
                   [FGRReadOptionItem itemWith:@"行距" iconName:nil info:@"合适"],
                   [FGRReadOptionItem itemWith:@"翻页样式" iconName:nil info:@"无翻页效果"],
                   [FGRReadOptionItem itemWith:@"字体" iconName:nil info:@"系统默认"],
                   [FGRReadOptionItem itemWith:@"繁简切换" iconName:nil info:@"简体"]];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    table.scrollEnabled = NO;
    table.delegate = self;
    table.dataSource = self;
    table.rowHeight = 55;
    table.separatorInset = UIEdgeInsetsMake(-1, -20, 1, -20);
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
    if (indexPath.row == 0) {
        return;
    }
    
    FGRReadOptionConfigController *config = [[FGRReadOptionConfigController alloc] initWithNibName:@"FGRReadOptionConfigController" bundle:nil];
    FGRReadOptionGroup *group = [[FGRReadOptionGroup alloc] init];
    group.selectIndex = 0;
    group.items = @[[FGRReadOptionItem itemWith:@"翻页样式" iconName:nil info:nil],
                    [FGRReadOptionItem itemWith:@"无翻页效果" iconName:nil info:nil],
                    [FGRReadOptionItem itemWith:@"仿真翻页" iconName:nil info:nil],
                    [FGRReadOptionItem itemWith:@"左右覆盖" iconName:nil info:nil],
                    [FGRReadOptionItem itemWith:@"左右平移" iconName:nil info:nil],
                    [FGRReadOptionItem itemWith:@"上下覆盖" iconName:nil info:nil],
                    [FGRReadOptionItem itemWith:@"上下平移" iconName:nil info:nil],
                    [FGRReadOptionItem itemWith:@"上下滚屏" iconName:nil info:nil],
                    [FGRReadOptionItem itemWith:@"自动翻页" iconName:nil info:nil],];
    config.group = group;
    [self.navigationController pushViewController:config animated:NO];
}

@end

















