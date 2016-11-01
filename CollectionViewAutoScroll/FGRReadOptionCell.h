//
//  FGRReadOptionCell.h
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FGRReadOptionItem.h"

@interface FGRReadOptionCell : UITableViewCell<FGRReadOptionItem>
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;

@property (nonatomic, strong) FGRReadOptionItem *item;

@end
