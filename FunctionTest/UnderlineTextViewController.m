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

@interface UnderlineTextViewController ()<YJNFormUnderlineTextViewDelegate>
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
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)yjn_textDidchanged:(YJNFormUnderlineTextView *)textView {
    NSLog(@"文本发生变化:%@",textView.text);
}

-(YJNFormUnderlineTextView *)underlineView {
    if (!_underlineView) {
        _underlineView = [[YJNFormUnderlineTextView alloc] initWithFont:[UIFont systemFontOfSize:15.0f]];
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineHeightMultiple = 2.0f;
        
        NSDictionary *attribute = @{NSReadOnlyDocumentAttribute:@2,
                                    NSParagraphStyleAttributeName:paragraph,
                                    NSFontAttributeName:[UIFont systemFontOfSize:14.0f]
                                    };
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:@" " attributes:attribute];
        _underlineView.attributedText = attr;
        _underlineView.yjn_delegate = self;
    }
    return _underlineView;
}

@end
