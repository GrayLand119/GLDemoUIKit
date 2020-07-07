//
//  GLTransitionPageVC.m
//  GLUIKit_Example
//
//  Created by GrayLand on 2020/3/16.
//  Copyright © 2020 GrayLand119. All rights reserved.
//

#import "GLTransitionPageVC.h"

@interface GLTransitionPageVC ()

@end

@implementation GLTransitionPageVC

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
    [self setupLayouts];
}

- (void)setupViews {
    self.view.backgroundColor = UIColor.orangeColor;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setBackgroundColor:UIColor.lightGrayColor];
    [btn setTitle:@"Back" forState:UIControlStateNormal];
    [btn setTitleColor:AUTO_TITLE_COLOR forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(btn.superview);
        make.height.mas_equalTo(50);
    }];
}

- (void)setupLayouts {
    
}

#pragma mark - Custom delegate

#pragma mark - Event response

- (void)onBack {
    [self autoPopBack];
}
#pragma mark - Public methods

#pragma mark - Private methods

#pragma mark - Setter

#pragma mark - Getter

@end
