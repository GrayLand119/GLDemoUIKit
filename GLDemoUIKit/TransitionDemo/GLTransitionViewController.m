//
//  GLTransitionViewController.m
//  GLUIKit_Example
//
//  Created by GrayLand on 2020/3/10.
//  Copyright © 2020 GrayLand119. All rights reserved.
//

#import "GLTransitionViewController.h"
#import "GLBaseTableView.h"
#import "GLTransitionPageVC.h"
#import "GLDemoCustomTransitionAnimator.h"
#import "GLTablePageVC.h"

@interface GLTransitionViewController ()
@property (nonatomic, strong) GLBaseTableView *tableView;
@end

@implementation GLTransitionViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupViews];
    [self setupLayouts];
    
    [self setupDatas];
}

- (void)setupViews {
    [self.view addSubview:self.tableView];
}

- (void)setupLayouts {
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}

- (void)setupDatas {
    GLTransitionPageVC *vc = [GLTransitionPageVC new];
    
    NSMutableArray *models = [NSMutableArray arrayWithCapacity:10];
    {
    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    GLFastCellModel *trans = [GLFastCellModel new];
    trans.title = @"System Style";
    trans.detail = @"";
    [trans setDidSelectedHandler:^(GLFastCellModel * _Nonnull model) {
        [self presentViewController:vc animated:YES completion:nil];
    }];
    [models addObject:trans];
    }
    
    {
    GLFastCellModel *trans = [GLFastCellModel new];
    trans.title = @"Left";
    trans.detail = @"Presen from left";
    [trans setDidSelectedHandler:^(GLFastCellModel * _Nonnull model) {
        [self gl_presentViewController:vc animationStyle:(GLTransitionAnimationStyleLeft) completion:nil];
    }];
    [models addObject:trans];
    }
    
    {
    GLFastCellModel *trans = [GLFastCellModel new];
    trans.title = @"Right";
    trans.detail = @"Presen from right";
    [trans setDidSelectedHandler:^(GLFastCellModel * _Nonnull model) {
        [self gl_presentViewController:vc animationStyle:GLTransitionAnimationStyleRight completion:nil];
    }];
    [models addObject:trans];
    }
    
    {
    GLFastCellModel *trans = [GLFastCellModel new];
    trans.title = @"Popup";
    trans.detail = @"";
    [trans setDidSelectedHandler:^(GLFastCellModel * _Nonnull model) {
        [self gl_presentViewController:vc animationStyle:GLTransitionAnimationStylePopup completion:nil];
    }];
    [models addObject:trans];
    }
    
    {
    GLFastCellModel *trans = [GLFastCellModel new];
    trans.title = @"Top";
    trans.detail = @"Presen from top";
    [trans setDidSelectedHandler:^(GLFastCellModel * _Nonnull model) {
        [self gl_presentViewController:vc animationStyle:GLTransitionAnimationStyleTop completion:nil];
    }];
    [models addObject:trans];
    }
    
    {
    GLFastCellModel *trans = [GLFastCellModel new];
    trans.title = @"CrossDissolve";
    trans.detail = @"--";
    [trans setDidSelectedHandler:^(GLFastCellModel * _Nonnull model) {
        [self gl_presentViewController:vc animationStyle:GLTransitionAnimationStyleCrossDissolve completion:nil];
    }];
    [models addObject:trans];
    }
    
    {
    GLFastCellModel *trans = [GLFastCellModel new];
    trans.title = @"Custom";
    trans.detail = @"--";
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [trans setDidSelectedHandler:^(GLFastCellModel * _Nonnull model) {
        [self gl_presentViewController:vc customTransitionAnimator:[GLDemoCustomTransitionAnimator new] completion:nil];
    }];
    [models addObject:trans];
    }
    
    {
    GLFastCellModel *trans = [GLFastCellModel new];
    trans.title = @"Pop Gesture";
    trans.detail = @"Swipe left to right";
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    GLTablePageVC *tvc = [GLTablePageVC new];
    [trans setDidSelectedHandler:^(GLFastCellModel * _Nonnull model) {
        [self.navigationController pushViewController:tvc animated:YES];
    }];
    [models addObject:trans];
    }
    
    
    _tableView.fastCellModels = models;
    [_tableView reloadData];
}
#pragma mark - Custom delegate

#pragma mark - Event response

#pragma mark - Public methods

#pragma mark - Private methods

#pragma mark - Setter

#pragma mark - Getter

- (GLBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [GLBaseTableView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.backgroundColor = UIColor.greenColor;
    }
    return _tableView;
}

#pragma mark - Test


@end
