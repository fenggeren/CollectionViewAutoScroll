//
//  FGRReadOptionModel.h
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, FGRReadOptionType) {
    FGRReadOptionTypeLineSpace,
    FGRReadOptionTypeFlipStyle,
    FGRReadOptionTypeFont,
};

@class FGRReadOptionItem;


@protocol FGRReadOptionItem <NSObject>
@property (nonatomic, strong) FGRReadOptionItem *item;
@end

@interface FGRReadOptionItem : NSObject

+ (instancetype)itemWith:(NSString *)name iconName:(NSString *)iconName info:(NSString *)info;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, copy) NSString *info;

@end


@interface FGRReadOptionGroup : NSObject
@property (nonatomic, strong) NSArray<FGRReadOptionItem *> *items;
@property (nonatomic, assign) NSInteger selectIndex;
@end


