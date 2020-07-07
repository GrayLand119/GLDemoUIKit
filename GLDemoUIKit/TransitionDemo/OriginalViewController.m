//
//  OriginalViewController.m
//  GLUIKit_Example
//
//  Created by GrayLand on 2020/3/8.
//  Copyright © 2020 GrayLand119. All rights reserved.
//

#import "OriginalViewController.h"

@interface OriginalViewController ()
@property (nonatomic, strong) UIButton *pushBtn;
@property (nonatomic, strong) UIButton *changeMode;

@end

@implementation OriginalViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorNamed:@"glBackgroundColor"];
    self.title = @"OriginalViewController";
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneItem)];
    self.navigationItem.rightBarButtonItem = doneItem;
    
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"icons8-back"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] style:(UIBarButtonItemStyleDone) target:self action:@selector(onImageItem)];
    self.navigationItem.leftBarButtonItem = imageItem;
    
    [self setupViews];
    [self setupLayouts];
}

- (void)setupViews {
    [self.view addSubview:self.pushBtn];
    [self.view addSubview:self.changeMode];
}

- (void)setupLayouts {
    [_pushBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(20);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(44);
    }];
    [_changeMode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.height.mas_equalTo(_pushBtn);
        make.top.mas_equalTo(_pushBtn.mas_bottom).offset(12);
    }];
}

#pragma mark - Custom delegate

#pragma mark - Event response

- (void)onPushBtn {
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = NAME_COLOR(GL_BG_COLOR);
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)onChangeMode {
    if (@available(iOS 13, *)) {
        if (UIUserInterfaceStyleLight == self.overrideUserInterfaceStyle) {
            self.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
        }else {
            self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
        }
    } else {
    }
}

- (void)onDoneItem {
    [self dismissViewControllerAnimated:YES completion:nil];
}
    
- (void)onImageItem {
    DLog(@"onImageItem");
}

#pragma mark - Private methods

#pragma mark - Setter

#pragma mark - Getter

- (UIButton *)pushBtn {
    if (!_pushBtn) {
        
        _pushBtn = [UIButton new];
        [_pushBtn setTitleColor:NAME_COLOR(GL_TITLE_COLOR) forState:UIControlStateNormal];
        [_pushBtn setTitle:@"Push" forState:UIControlStateNormal];
        [_pushBtn addTarget:self action:@selector(onPushBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushBtn;
}
- (UIButton *)changeMode {
    if (!_changeMode) {
        _changeMode = [UIButton new];
        [_changeMode setTitleColor:NAME_COLOR(GL_TITLE_COLOR) forState:UIControlStateNormal];
        [_changeMode setTitle:@"ChangeMode" forState:UIControlStateNormal];
        [_changeMode addTarget:self action:@selector(onChangeMode) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeMode;
}

@end
