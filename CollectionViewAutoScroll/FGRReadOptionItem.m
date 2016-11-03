//
//  FGRReadOptionModel.m
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import "FGRReadOptionItem.h"
#import "FGROptionManager.h"

@implementation FGRReadOptionItem

+ (instancetype)itemWith:(NSString *)name iconName:(NSString *)iconName optionType:(FGRReadOptionType)type;
{
    FGRReadOptionItem *item = [[self alloc] init];
    item.name = name;
    item.iconName = iconName;
    item.type = type;
    return item;
}

- (NSString *)info
{
    return [[FGROptionManager sharedInstance] valueForSelectIndexWithType:self.type];
}

@end
