//
//  FGRBottomMenuController.m
//  CollectionViewAutoScroll
//
//  Created by HuanaoGroup on 16/11/1.
//  Copyright © 2016年 HuanaoGroup. All rights reserved.
//

#import "FGRBottomMenuController.h"
#import "FGRBottomMenu.h"
#import "FGRReadOptionViewController.h"

@interface FGRBottomMenuController () <FGRBottomMenuProtocol>
@property (nonatomic, strong) FGRBottomMenu *bottomMenu;
@end

@implementation FGRBottomMenuController

+ (instancetype)bottomMenuController
{
    return [[self alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

//+ (instancetype)menuControllerWith:(UIView *)view
//{
//    FGRBottomMenuController *menu = [[self alloc] init];
//    menu.view = view;
//    return menu;
//}

#pragma mark - 

- (void)show
{
    [self.bottomMenu show];
}

- (void)dismiss
{
    [self.bottomMenu dismiss];
}

#pragma mark -

- (NSArray<UIView *> *)viewsInBottomMenu:(FGRBottomMenu *)bottomMenu
{
    UILabel *(^labelBlock)(NSString *, NSInteger) = ^UILabel*(NSString *title, NSInteger tag) {
        UILabel *l = [[UILabel alloc] init];
        l.userInteractionEnabled = YES;
        l.backgroundColor = [UIColor lightGrayColor];
        l.text = title;
        l.tag = tag;
        l.font = [UIFont systemFontOfSize:20];
        l.textColor = [UIColor whiteColor];
        l.textAlignment = NSTextAlignmentCenter;
        [l addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBottomMenuItem:)]];
        return l;
    };
    return @[labelBlock(@"目录", 0), labelBlock(@"进度", 1),
             labelBlock(@"选项", 2), labelBlock(@"显示", 3)];
}


- (void)clickBottomMenuItem:(UITapGestureRecognizer *)tap
{
    if (tap.state == UIGestureRecognizerStateEnded) {
        switch (tap.view.tag) {
            case 0:
            {
                
            }
                break;
            case 1:
            {
                
            }
                break;
            case 2:
            {
                FGRReadOptionViewController *optionVC = [[FGRReadOptionViewController alloc] initWithNibName:@"FGRReadOptionViewController" bundle:nil];
                [self.navigationController pushViewController:optionVC animated:NO];
            }
                break;
            case 3:
            {
                
            }
                break;
            default:
                break;
        }
    }
}
#define kBottomMenuHeight 55
- (CGRect)originalFrameForBottomMenu:(FGRBottomMenu *)bottomMenu
{
    return CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, kBottomMenuHeight);
}
- (CGRect)showFrameForBottomMenu:(FGRBottomMenu *)bottomMenu
{
    return CGRectMake(0, self.view.bounds.size.height - kBottomMenuHeight, self.view.bounds.size.width, kBottomMenuHeight);
}
- (NSTimeInterval)showAnimationIntervalForBottomMenu:(FGRBottomMenu *)bottomMenu
{
    return .5;
}


#pragma mark - 

- (FGRBottomMenu *)bottomMenu
{
    if (!_bottomMenu) {
        _bottomMenu = [[FGRBottomMenu alloc] init];
        _bottomMenu.delegate = self;
        _bottomMenu.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:_bottomMenu];
    }
    return _bottomMenu;
}
@end
