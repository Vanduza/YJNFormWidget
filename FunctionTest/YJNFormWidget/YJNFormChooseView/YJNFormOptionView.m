//
//  YJNFormOptionView.m
//  FunctionTest
//
//  Created by YangJing on 2017/10/24.
//  Copyright © 2017年 YangJing. All rights reserved.
//

#import "YJNFormOptionView.h"
#import "Masonry.h"

@implementation YJNFormOptionView
-(instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.optionLabel];
        
        [_optionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

-(void)setSelected:(BOOL)selected {
    _selected = selected;
    if (selected) {
        self.backgroundColor = [UIColor redColor];
    }else {
        self.backgroundColor = [UIColor blueColor];
    }
}

#pragma mark - Property
-(UILabel *)optionLabel {
    if (!_optionLabel) {
        _optionLabel = [[UILabel alloc] init];
    }
    return _optionLabel;
}
@end
