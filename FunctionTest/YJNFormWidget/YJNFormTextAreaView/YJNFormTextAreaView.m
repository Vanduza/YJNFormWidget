//
//  YJNFormTextAreaView.m
//  XMessageChatDemo
//
//  Created by YangJing on 2017/11/3.
//  Copyright © 2017年 杨敬. All rights reserved.
//

#import "YJNFormTextAreaView.h"
#import "Masonry.h"

@interface YJNFormTextAreaView()<UITextViewDelegate>
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *contentTextView;
@end

@implementation YJNFormTextAreaView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self p_initView];
    }
    return self;
}

-(void)p_initView {
    CGFloat ratio = 375.0 / [UIScreen mainScreen].bounds.size.width;
    [self addSubview:self.titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
    }];
    
    [self addSubview:self.contentTextView];
    [_contentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(20 / ratio);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(100);
        make.bottom.equalTo(self);
    }];
}

#pragma mark - YJNQuestionConfigProtocol
-(void)yjn_configViewWithQuestion:(XMsgQuestionModel *)question {
    _titleLabel.text = question.label;
    _contentTextView.text = question.value;
    //答案为空，标题显示提醒色
    if (question.isEmpty) {
        _titleLabel.textColor = [UIColor colorWithRed:1.0 green:0.36 blue:0.22 alpha:1.0];
    }else {
        _titleLabel.textColor = [UIColor colorWithRed:0.26 green:0.26 blue:0.26 alpha:1.0];
    }
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    if (self.contentReturnBlock) {
        self.contentReturnBlock(textView.text);
    }
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        
        return NO;
    }
    
    return YES;
}

#pragma mark - Property
-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"";
        _titleLabel.font = [UIFont systemFontOfSize:14.0f];
        _titleLabel.textColor = [UIColor colorWithRed:0.26 green:0.26 blue:0.26 alpha:1.0];
    }
    return _titleLabel;
}

-(UITextView *)contentTextView {
    if (!_contentTextView) {
        _contentTextView = [[UITextView alloc] init];
        _contentTextView.delegate = self;
        _contentTextView.returnKeyType = UIReturnKeyDone;
        _contentTextView.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.0f];
    }
    return _contentTextView;
}
@end
