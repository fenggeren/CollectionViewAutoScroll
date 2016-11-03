//
//  FGRReadOptionModel.h
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, FGRReadOptionType) {
    FGRReadOptionTypeFontSize,
    FGRReadOptionTypeLineSpace,
    FGRReadOptionTypeFlipStyle,
    FGRReadOptionTypeFontStyle,
    FGRReadOptionTypeLanguage,
};

@class FGRReadOptionItem;


@protocol FGRReadOptionItem <NSObject>
@property (nonatomic, strong) FGRReadOptionItem *item;
@end

@interface FGRReadOptionItem : NSObject

+ (instancetype)itemWith:(NSString *)name iconName:(NSString *)iconName optionType:(FGRReadOptionType)type;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, assign) FGRReadOptionType type;

@property (nonatomic, readonly) NSString *info;

@end

 
