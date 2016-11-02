//
//  FGRBottomMenu.h
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FGRBottomMenu;

@protocol FGRBottomMenuProtocol <NSObject>

- (NSArray<UIView *> *)viewsInBottomMenu:(FGRBottomMenu *)bottomMenu;
- (CGRect)originalFrameForBottomMenu:(FGRBottomMenu *)bottomMenu;
- (CGRect)showFrameForBottomMenu:(FGRBottomMenu *)bottomMenu;
- (NSTimeInterval)showAnimationIntervalForBottomMenu:(FGRBottomMenu *)bottomMenu;

@optional
- (dispatch_block_t)showAnimationForBottomMenu:(FGRBottomMenu *)bottomMenu;
- (dispatch_block_t)dismissAnimationForBottomMenu:(FGRBottomMenu *)bottomMenu;
@end


@interface FGRBottomMenu : UIView

- (BOOL)isShow;

- (void)show;
- (void)dismissComplete:(dispatch_block_t)block;

@property (nonatomic, weak) id<FGRBottomMenuProtocol> delegate;

@end
