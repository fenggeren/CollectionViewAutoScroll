//
//  FGRReadOptionNaviCell.m
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import "FGRReadOptionNaviCell.h"

@implementation FGRReadOptionNaviCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setItem:(FGRReadOptionItem *)item
{
    _item = item;
    self.lblTitle.text = item.name;
}

@end
