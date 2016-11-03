//
//  FGRReadOptionFontSizeSlider.m
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/3.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import "FGRReadOptionFontSizeSlider.h"
#import "FGROptionManager.h"

#define kMargin 2

@interface FGRReadOptionFontSizeSlider ()
@property (nonatomic, assign) NSInteger scaleNum;
@property (nonatomic, strong) UIView *thumbView;
@end

@implementation FGRReadOptionFontSizeSlider

- (instancetype)initWithScaleNum:(NSInteger)scaleNum
{
    if (self = [super init]) {
        self.opaque = NO;
        _thumbView = [[UIView alloc] init];
        _thumbView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_thumbView];
        _scaleNum = scaleNum < 3 ? 3 : scaleNum;
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panThumb:)];
        [_thumbView addGestureRecognizer:pan];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat thumbWidth = self.thumbHeight;
    self.thumbView.frame = CGRectMake(0, 0, thumbWidth, thumbWidth);
    self.thumbView.center = CGPointMake([self centerXForScaleIndex:_index], CGRectGetMidY(self.bounds));
    self.thumbView.clipsToBounds = YES;
    self.thumbView.layer.cornerRadius = CGRectGetWidth(self.thumbView.bounds) * 0.5;
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor whiteColor] set];
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPath];
    CGFloat centerY = CGRectGetMidY(rect);
    bezierPath1.lineWidth = 2;
    [bezierPath1 moveToPoint:CGPointMake([self centerXForScaleIndex:0], centerY)];
    [bezierPath1 addLineToPoint:CGPointMake([self centerXForScaleIndex:_scaleNum - 1], centerY)];
    [bezierPath1 stroke];
    
    UIBezierPath *bezierPath2 = [UIBezierPath bezierPath];
    for (NSInteger i = 0; i < _scaleNum; ++i) {
        [bezierPath2 addArcWithCenter:CGPointMake([self centerXForScaleIndex:i], centerY) radius:4 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    }
    [bezierPath2 fill];
}

#pragma mark - Action

- (void)panThumb:(UIPanGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint pos = [pan translationInView:self];
        if (pos.x > 0) {
            if (self.thumbView.center.x + pos.x >= [self centerXForScaleIndex:_index + 1]) {
                self.index += 1;
                [pan setTranslation:CGPointZero inView:self];
            }
        } else if (pos.x < 0) {
            if (self.thumbView.center.x + pos.x <= [self centerXForScaleIndex:_index - 1]) {
                self.index -= 1;
                [pan setTranslation:CGPointZero inView:self];
            }
        }

    }
}

#pragma mark -

- (CGFloat)centerXForScaleIndex:(NSInteger)index
{
    CGFloat thumHeight = self.bounds.size.height - kMargin * 2;
    CGFloat scaleWidth = floor((self.bounds.size.width - kMargin * 2 - self.thumbHeight) / (_scaleNum - 1));
    CGFloat oriX = kMargin +  thumHeight * 0.5 + index * scaleWidth;
    return oriX;
}

#pragma mark -

- (void)setIndex:(NSInteger)index
{
    if (_index == index) {
        return;
    }
    
    if (index < 0 || index >= self.scaleNum) {
        return;
    }
    _index = index;
    [FGROptionManager sharedInstance].fontSizeIndex = index;
    self.thumbView.center = CGPointMake([self centerXForScaleIndex:index], CGRectGetMidY(self.bounds));
}

- (CGFloat)thumbHeight
{
    return self.bounds.size.height - kMargin * 6;;
}

@end










