//
//  FGRBottomMenuController.h
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FGRBottomMenuController : UIViewController

+ (instancetype)bottomMenuController;
//+ (instancetype)menuControllerWith:(UIView *)view;
- (void)show;

- (void)dismissComplete:(dispatch_block_t)block;

@end
