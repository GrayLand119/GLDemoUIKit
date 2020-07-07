//
//  GLTablePageVC.m
//  GLUIKit_Example
//
//  Created by GrayLand on 2020/3/18.
//  Copyright © 2020 GrayLand119. All rights reserved.
//

#import "GLTablePageVC.h"
#import "GLBaseTableView.h"

@interface GLTablePageVC ()
@property (nonatomic, strong) GLBaseTableView *tableView;
@end

@implementation GLTablePageVC

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
    [self setupLayouts];
    
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:20];
    for (int i = 0; i < 20; i++) {
        GLFastCellModel *model = [GLFastCellModel new];
        model.title = [NSString stringWithFormat:@"Content Cell %@", @(i)];
        model.cellHeight = 50;
        [arr addObject:model];
    }
    _tableView.fastCellModels = arr;
    [_tableView reloadData];
}

- (void)setupViews {
    _tableView = [GLBaseTableView new];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (void)setupLayouts {
    
}

#pragma mark - Custom delegate

#pragma mark - Event response

#pragma mark - Public methods

#pragma mark - Private methods

#pragma mark - Setter

#pragma mark - Getter

@end
