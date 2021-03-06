//
//  FGRReadOptionNaviCell.h
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FGRReadOptionItem.h"

@interface FGRReadOptionNaviCell : UITableViewCell<FGRReadOptionItem>
@property (weak, nonatomic) IBOutlet UIButton *btnReturn;

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property (nonatomic, strong) FGRReadOptionItem *item;

@end
