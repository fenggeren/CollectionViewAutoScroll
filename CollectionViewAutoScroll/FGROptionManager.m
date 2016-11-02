//
//  FGROptionManager.m
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/2.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import "FGROptionManager.h"


#define kFontSize   @"fontSize"
#define kLineSpace  @"lineSpace"
#define kFontStyle  @"fontStyle"
#define kFlipStyle  @"flipStyle"
#define kLanguages @"languages"

@interface FGROptionManager()

@end


@implementation FGROptionManager


+ (instancetype)sharedInstance
{
    static FGROptionManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self config];
    }
    return self;
}

- (void)config
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"FGRReadOptions.plist" ofType:nil];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
 
    self.fontSizes = dict[kFontSize];
    self.flipStyles = dict[kFlipStyle];
    self.languages = dict[kLanguages];
    
 
    NSDictionary<NSString*, NSNumber*> *lineSpaceDict = dict[kLineSpace];
    NSArray *lineSpaceKeys = [lineSpaceDict keysSortedByValueUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        return obj1.integerValue >= obj2.integerValue;
    }];
    NSMutableArray *values = [NSMutableArray array];
    for(NSString *lineSpaceKey in lineSpaceKeys) {
        NSNumber *lineSpace = lineSpaceDict[lineSpaceKey];
        [values addObject:lineSpace];
    }
    self.lineSpaceNames = lineSpaceKeys;
    self.lineSpaceValues = values;
    
    
    NSDictionary *fontStyleDict = dict[kFontStyle];
    self.fontStyleNames = fontStyleDict[@"keys"];
    self.fontStyleValues = fontStyleDict[@"values"];
    
    self.fontSizeIndex = [[NSUserDefaults standardUserDefaults] integerForKey:kFontSize];
    self.lineSpaceIndex = [[NSUserDefaults standardUserDefaults] integerForKey:kLineSpace];
    self.flipStyleIndex = [[NSUserDefaults standardUserDefaults] integerForKey:kFlipStyle];
    self.fontStyleIndex = [[NSUserDefaults standardUserDefaults] integerForKey:kFontStyle];
    self.languagesIndex = [[NSUserDefaults standardUserDefaults] integerForKey:kLanguages];
}

- (void)setFontSizeIndex:(NSInteger)fontSizeIndex
{
    if (_fontSizeIndex != fontSizeIndex) {
        _fontSizeIndex = fontSizeIndex;
        [[NSUserDefaults standardUserDefaults] setInteger:_fontSizeIndex forKey:kFontSize];
    }
}

- (void)setLineSpaceIndex:(NSInteger)lineSpaceIndex
{
    if (_lineSpaceIndex != lineSpaceIndex) {
        _lineSpaceIndex = lineSpaceIndex;
        [[NSUserDefaults standardUserDefaults] setInteger:lineSpaceIndex forKey:kLineSpace];
    }
}

- (void)setFlipStyleIndex:(NSInteger)flipStyleIndex
{
    if (_flipStyleIndex != flipStyleIndex) {
        _flipStyleIndex = flipStyleIndex;
        [[NSUserDefaults standardUserDefaults] setInteger:flipStyleIndex forKey:kFlipStyle];
    }
}

- (void)setFontStyleIndex:(NSInteger)fontStyleIndex
{
    if (_fontStyleIndex != fontStyleIndex) {
        _fontStyleIndex = fontStyleIndex;
        [[NSUserDefaults standardUserDefaults] setInteger:fontStyleIndex forKey:kFontStyle];
    }
}


- (void)setLanguagesIndex:(NSInteger)languagesIndex
{
    if (_languagesIndex != languagesIndex) {
        _languagesIndex = languagesIndex;
        [[NSUserDefaults standardUserDefaults] setInteger:languagesIndex forKey:kLanguages];
    }
}

- (NSInteger)selectIndexWith:(FGRReadOptionType)type
{
    switch (type) {
        case FGRReadOptionTypeFontSize:
            return self.fontSizeIndex;
        case FGRReadOptionTypeLanguage:
            return self.languagesIndex;
        case FGRReadOptionTypeFlipStyle:
            return self.flipStyleIndex;
        case FGRReadOptionTypeFontStyle:
            return self.fontStyleIndex;
        case FGRReadOptionTypeLineSpace:
            return self.lineSpaceIndex;
    }
}

- (NSArray *)keysWith:(FGRReadOptionType)type
{
    switch (type) {
        case FGRReadOptionTypeLineSpace:
            return [FGROptionManager sharedInstance].lineSpaceNames;
        case FGRReadOptionTypeFontStyle:
            return [FGROptionManager sharedInstance].fontStyleNames;
        case FGRReadOptionTypeFlipStyle:
            return [FGROptionManager sharedInstance].flipStyles;
        case FGRReadOptionTypeLanguage:
            return [FGROptionManager sharedInstance].languages;
        case FGRReadOptionTypeFontSize:
            return [FGROptionManager sharedInstance].fontSizes;
    }
}

@end


























