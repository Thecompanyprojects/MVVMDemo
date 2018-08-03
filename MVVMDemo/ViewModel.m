//
//  ViewModel.m
//  MVVMDemo
//
//  Created by 王俊钢 on 2018/8/3.
//  Copyright © 2018年 wangjungang. All rights reserved.
//

#import "ViewModel.h"
#import "Model.h"

@interface ViewModel()
/** 数据模型 */
@property (nonatomic, strong) Model *nnModel;

@property (nonatomic, copy) NSArray *nickNameArray;

@end
@implementation ViewModel

/** 模拟网络请求 */
- (void)requestData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 新请求下来一个 model
        self.nnModel.age = arc4random() % 100;
        self.nnModel.height = arc4random() % 20 + 160;
        self.nnModel.nickName = self.nickNameArray[arc4random() % 6];
        
        NSArray *tempArray = @[[self dealWithData:0], [self dealWithData:1], [self dealWithData:2]];
        self.contentString = tempArray[arc4random() % 3];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"requestNNModel" object:nil];
    });
}

#pragma mark - 私有方法区域
/** 处理数据 */
- (NSString *)dealWithData:(NSInteger)data {
    switch (data) {
        case 0:
            return [NSString stringWithFormat:@"年龄: %ld 岁", self.nnModel.age];
            break;
        case 1:
            return [NSString stringWithFormat:@"身高: %ld cm", self.nnModel.height];
            break;
        case 2:
            return [NSString stringWithFormat:@"昵称: %@", self.nnModel.nickName];
            break;
        default:
            break;
    }
    return @"";
}

#pragma mark - 懒加载区域
- (Model *)nnModel {
    if (!_nnModel) {
        _nnModel = [[Model alloc] init];
    }
    return _nnModel;
}

- (NSArray *)nickNameArray {
    if (!_nickNameArray) {
        _nickNameArray = @[@"张三", @"李四", @"王五", @"赵六", @"孙七", @"周八"];
    }
    return _nickNameArray;
}
@end
