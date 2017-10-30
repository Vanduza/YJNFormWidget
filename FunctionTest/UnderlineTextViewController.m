//
//  UnderlineTextViewController.m
//  FunctionTest
//
//  Created by YangJing on 2017/10/30.
//  Copyright © 2017年 YangJing. All rights reserved.
//

#import "UnderlineTextViewController.h"
#import "YJNFormUnderlineTextView.h"
#import "Masonry.h"

@interface UnderlineTextViewController ()
@property (nonatomic, strong) YJNFormUnderlineTextView *underlineView;
@end

@implementation UnderlineTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_initView];
}

-(void)p_initView {
    self.view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
    [self.view addSubview:self.underlineView];
    [_underlineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(100);
        make.height.mas_equalTo(200);
    }];
    
    UITextView *testView = [[UITextView alloc] init];
    [self.view addSubview:testView];
    [testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(_underlineView.mas_bottom).offset(20);
        make.height.mas_equalTo(200);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(YJNFormUnderlineTextView *)underlineView {
    if (!_underlineView) {
        _underlineView = [[YJNFormUnderlineTextView alloc] initWithFont:[UIFont systemFontOfSize:15.0f]];
    }
    return _underlineView;
}

@end
