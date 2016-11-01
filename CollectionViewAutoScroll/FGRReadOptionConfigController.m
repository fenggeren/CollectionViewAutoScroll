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
@interface FGRReadOptionConfigController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FGRReadOptionConfigController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor clearColor];
    
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
    [table registerNib:[UINib nibWithNibName:@"FGRReadOptionNaviCell" bundle:nil] forCellReuseIdentifier:@"FGRReadOptionNaviCell"];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat height = self.group.items.count * self.tableView.rowHeight;
    self.tableView.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds) - height, CGRectGetWidth(self.view.bounds), height);
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = nil;
    if (indexPath.row == 0) {
        identifier = @"FGRReadOptionNaviCell";
    } else {
        identifier = @"FGRReadOptionCell";
    }
    UITableViewCell<FGRReadOptionItem> *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.item = self.group.items[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return;
    }
}


@end







