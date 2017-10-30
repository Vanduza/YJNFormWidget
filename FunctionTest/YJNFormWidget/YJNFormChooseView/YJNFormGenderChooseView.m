//
//  YJNFormGenderChooseView.m
//  FunctionTest
//
//  Created by YangJing on 2017/10/25.
//  Copyright © 2017年 YangJing. All rights reserved.
//

#import "YJNFormGenderChooseView.h"
#import "Masonry.h"
@interface YJNFormGenderChooseView()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *man;
@property (nonatomic, strong) UIView *woman;
@end
@implementation YJNFormGenderChooseView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self p_initView];
    }
    return self;
}

-(void)p_initView {
    _isEditing = YES;
}

-(void)setIsEditing:(BOOL)isEditing {
    _isEditing = isEditing;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

@end
