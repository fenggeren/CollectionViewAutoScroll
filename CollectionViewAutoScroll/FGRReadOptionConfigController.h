//
//  FGRReadOptionConfigController.h
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FGRReadOptionItem.h"

@interface FGRReadOptionConfigController : UIViewController

@property (nonatomic, strong) NSArray<NSString *> *names;

@property (nonatomic, assign) FGRReadOptionType optionType;

@property (nonatomic, copy) NSString *navTitle;
@end
