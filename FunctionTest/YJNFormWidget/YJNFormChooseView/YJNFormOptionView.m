//
//  YJNFormOptionView.m
//  FunctionTest
//
//  Created by YangJing on 2017/10/24.
//  Copyright © 2017年 YangJing. All rights reserved.
//

#import "YJNFormOptionView.h"
#import "Masonry.h"
@interface YJNFormOptionView()

@end
@implementation YJNFormOptionView
-(instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.optionLabel];
        [self addSubview:self.icon];
    
        [_optionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(self);
        }];
        
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_optionLabel.mas_right).offset(8);
            make.centerY.equalTo(_optionLabel);
            make.width.height.mas_equalTo(14.0f);
            make.right.equalTo(self).offset(-15.0f);
        }];
    }
    return self;
}

-(void)setSelected:(BOOL)selected {
    _selected = selected;
    if (selected) {
        _icon.image = [UIImage imageNamed:@"selected"];
        _optionLabel.textColor = [UIColor colorWithRed:0.29 green:0.64 blue:0.90 alpha:1.00];
    }else {
        _icon.image = [UIImage imageNamed:@"unselected"];
        _optionLabel.textColor = [UIColor colorWithRed:0.26 green:0.26 blue:0.26 alpha:1.0];
    }
}

#pragma mark - Property
-(UILabel *)optionLabel {
    if (!_optionLabel) {
        _optionLabel = [[UILabel alloc] init];
        _optionLabel.font = [UIFont systemFontOfSize:14.0f];
        _optionLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
    }
    return _optionLabel;
}

-(UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"unselected"]];
    }
    return _icon;
}
@end
