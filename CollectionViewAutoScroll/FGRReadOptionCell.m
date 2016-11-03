//
//  FGRReadOptionCell.m
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import "FGRReadOptionCell.h"
#import "FGRReadOptionItem.h"

@implementation FGRReadOptionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.iconImage.backgroundColor = [UIColor redColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setItem:(FGRReadOptionItem *)item
{
    _item = item;
    self.lblName.text = item.name;
    self.lblInfo.text = item.info;
    self.iconImage.image = [UIImage imageNamed:item.iconName];
}

@end
