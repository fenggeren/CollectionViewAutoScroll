//
//  FGRReadOptionFontSizeCell.h
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FGRReadOptionItem.h"

@interface FGRReadOptionFontSizeCell : UITableViewCell<FGRReadOptionItem>
@property (weak, nonatomic) IBOutlet UIButton *btnMiner;
@property (weak, nonatomic) IBOutlet UIButton *btnMaxer;
@property (weak, nonatomic) IBOutlet UISlider *sldFontSize;

@property (nonatomic, strong) FGRReadOptionItem *item;

@end
