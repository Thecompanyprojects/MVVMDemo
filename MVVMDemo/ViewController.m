//
//  ViewController.m
//  MVVMDemo
//
//  Created by 王俊钢 on 2018/8/1.
//  Copyright © 2018年 wangjungang. All rights reserved.
//

#import "ViewController.h"
#import "View.h"
#import "ViewModel.h"


@interface ViewController ()
@property (nonatomic, strong) View *nnView;
@property (nonatomic, strong) ViewModel *nnViewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.nnView];
    // 模拟请求数据
    [self.nnViewModel requestData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 懒加载区域
- (NNViewModel *)nnViewModel {
    if (!_nnViewModel) {
        _nnViewModel = [[NNViewModel alloc] init];
    }
    return _nnViewModel;
}

- (NNView *)nnView {
    if (!_nnView) {
        _nnView = [[NNView alloc] initWithFrame:self.view.frame viewModel:self.nnViewModel];
    }
    return _nnView;
}

@end
