//
//  FGRReadOptionFontSizeSlider.h
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/3.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FGRReadOptionFontSizeSlider : UIView

- (instancetype)initWithScaleNum:(NSInteger)scaleNum;

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign, readonly) NSInteger scaleNum;


@end
