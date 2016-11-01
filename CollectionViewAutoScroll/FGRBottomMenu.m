//
//  FGRBottomMenu.m
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import "FGRBottomMenu.h"


@interface FGRBottomMenu ()

@property (nonatomic, strong) NSArray<UIView *> *views;

@end


@implementation FGRBottomMenu

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = floor(self.bounds.size.width / self.views.count);
    CGFloat height = self.bounds.size.height;
    CGFloat maxX = 0;
    for (UIView *v in self.views) {
        v.frame = CGRectMake(maxX, 0, width, height);
        maxX += width;
    }
}


#pragma mark -

- (void)setDelegate:(id<FGRBottomMenuProtocol>)delegate
{
    _delegate = delegate;
    for (UIView *v in self.subviews) {
        [v removeFromSuperview];
    }
    [self config];
}

- (void)config
{
    NSArray<UIView *> *views = [self.delegate viewsInBottomMenu:self];
    for (UIView *v in views) {
        [self addSubview:v];
    }
    self.views = views;
}


- (void)show
{
    [self layoutIfNeeded];
    if ([self.delegate respondsToSelector:@selector(showAnimationForBottomMenu:)]) {
        [self.delegate showAnimationForBottomMenu:self]();
    } else {
        self.frame = [self.delegate originalFrameForBottomMenu:self];
        [UIView animateWithDuration:[self.delegate showAnimationIntervalForBottomMenu:self] animations:^{
            self.frame = [self.delegate showFrameForBottomMenu:self];
        }];
    }
}

- (void)dismiss
{
    if ([self.delegate respondsToSelector:@selector(dismissAnimationForBottomMenu:)]) {
        [self.delegate dismissAnimationForBottomMenu:self]();
    } else {
        self.frame = [self.delegate showFrameForBottomMenu:self];
        [UIView animateWithDuration:[self.delegate showAnimationIntervalForBottomMenu:self] animations:^{
            self.frame = [self.delegate originalFrameForBottomMenu:self];
        }];
    }
}




@end

















