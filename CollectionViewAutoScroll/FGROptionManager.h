//
//  FGROptionManager.h
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/2.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import <Foundation/Foundation.h> 
#import "FGRReadOptionItem.h"

@interface FGROptionManager : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) NSArray<NSString *> *languages;
@property (nonatomic, strong) NSArray<NSNumber *> *fontSizes;
@property (nonatomic, strong) NSArray<NSString *> *flipStyles;
@property (nonatomic, strong) NSArray<NSString *> *lineSpaceNames;
@property (nonatomic, strong) NSArray<NSString *> *fontStyleNames;

@property (nonatomic, strong) NSArray<NSNumber *> *lineSpaceValues;
@property (nonatomic, strong) NSArray<NSString *> *fontStyleValues; 

@property (nonatomic, assign) NSInteger fontSizeIndex;
@property (nonatomic, assign) NSInteger lineSpaceIndex;
@property (nonatomic, assign) NSInteger flipStyleIndex;
@property (nonatomic, assign) NSInteger fontStyleIndex;
@property (nonatomic, assign) NSInteger languagesIndex;

- (void)setSelectIndex:(NSInteger)selectIndex forType:(FGRReadOptionType)type;
- (NSInteger)selectIndexWith:(FGRReadOptionType)type;
- (NSArray *)keysWith:(FGRReadOptionType)type;

- (NSString *)valueForSelectIndexWithType:(FGRReadOptionType)type;
@end
