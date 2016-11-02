//
//  FGRReadOptionNaviView.m
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import "FGRReadOptionNaviView.h"

@implementation FGRReadOptionNaviView

+ (instancetype)nibView
{
    UINib *nib = [UINib nibWithNibName:@"FGRReadOptionNaviView" bundle:nil];
    return [nib instantiateWithOwner:self options:nil].firstObject;
}


@end
