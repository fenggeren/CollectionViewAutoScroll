//
//  FGRReadOptionModel.m
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import "FGRReadOptionItem.h"

@implementation FGRReadOptionItem

+ (instancetype)itemWith:(NSString *)name iconName:(NSString *)iconName info:(NSString *)info
{
    FGRReadOptionItem *item = [[self alloc] init];
    item.name = name;
    item.iconName = iconName;
    item.info = info;
    return item;
}

@end

@implementation FGRReadOptionGroup



@end
