//
//  FGRReadOptionFontSizeCell.m
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import "FGRReadOptionFontSizeCell.h"
#import "FGRReadOptionFontSizeSlider.h"

@interface FGRReadOptionFontSizeCell ()
@property (nonatomic, weak) FGRReadOptionFontSizeSlider *slider;
@end

@implementation FGRReadOptionFontSizeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.sldFontSize.hidden = YES;
    FGRReadOptionFontSizeSlider *slider = [[FGRReadOptionFontSizeSlider alloc] initWithScaleNum:8];
    slider.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:slider];
    _slider = slider;
}


- (void)updateConstraints
{
    
    NSArray *constraints = @[[NSLayoutConstraint constraintWithItem:self.slider attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.btnMiner attribute:NSLayoutAttributeRight multiplier:1. constant:8],
    [NSLayoutConstraint constraintWithItem:self.slider attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.btnMaxer attribute:NSLayoutAttributeLeft multiplier:1. constant:-8],
    [NSLayoutConstraint constraintWithItem:self.slider attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.btnMaxer attribute:NSLayoutAttributeHeight multiplier:1. constant:0],
      [NSLayoutConstraint constraintWithItem:self.slider attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1. constant:0]];
    [NSLayoutConstraint activateConstraints:constraints];
    
    [super updateConstraints];
}

- (IBAction)clkMaxer:(UIButton *)sender {
    self.slider.index += 1;
}

- (IBAction)clkMiner:(UIButton *)sender {
    self.slider.index -= 1;
}

@end
