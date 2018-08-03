//
//  ViewModel.h
//  MVVMDemo
//
//  Created by 王俊钢 on 2018/8/3.
//  Copyright © 2018年 wangjungang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewModel : NSObject
- (void)requestData;

@property (nonatomic, copy) NSString *contentString;

@end
