//
//  YJNFormChooseView.m
//  FunctionTestProduct
//
//  Created by YangJing on 2017/10/20.
//  Copyright © 2017年 YangJing. All rights reserved.
//

#import "YJNFormChooseView.h"
#import "Masonry.h"
#import "YJNQuestionModel.h"
#import "YJNFormOptionView.h"

@interface YJNFormChooseView()
@property (nonatomic, strong) NSMutableArray *optionViews;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, assign) YJNChooseStyle style;
@end
@implementation YJNFormChooseView {
    YJNQuestionModel *_currentQuestion;
}
#pragma mark - 初始化方法
-(instancetype)init {
    if (self = [super init]) {
        [self p_initView];
    }
    return self;
}

#pragma mark - 视图绘制
-(void)p_initView {
    //创建选择视图
    self.backgroundColor = [UIColor cyanColor];
    [self addSubview:self.titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
    }];
    
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor colorWithWhite:0.6 alpha:1];
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom);
        make.left.right.equalTo(self);
        make.bottom.equalTo(self).priorityLow();
    }];
    
    //循环绘制选项视图，最多支持10个选项
    //(为避免循环的频繁alloc和dealloc，方便TableViewCell上面复用)
    UIView *lastView = nil;
    for (int i = 0; i < 10; i++) {
        YJNFormOptionView *optionView = [[YJNFormOptionView alloc] init];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(optionSelected:)];
        [optionView addGestureRecognizer:tap];
        optionView.userInteractionEnabled = YES;
        optionView.tag = 400 + i;
        
        [backView addSubview:optionView];
        
        [self.optionViews addObject:optionView];
        
        if (i == 0) {
            lastView = optionView;
            [optionView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(backView.mas_top);
                make.left.right.equalTo(backView);
                make.height.mas_equalTo(0.0f);
            }];
        }else {
            [optionView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lastView.mas_bottom);
                make.centerX.width.equalTo(lastView);
                make.height.mas_equalTo(0.0f);
            }];
        }
        lastView = optionView;
    }
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(backView.mas_bottom);
    }];
}

-(void)configViewWithQuestion:(YJNQuestionModel *)question {
    _currentQuestion = question;
    NSLog(@"questionID=%@,selectedResult=%@",question.questionID,question.selectedResults);
    _style = question.type;
    for (int i = 0; i < question.options.count; i++) {
        YJNFormOptionView *optionView = [_optionViews objectAtIndex:i];
        if (optionView) {
            [optionView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(50.0f);
            }];
            optionView.optionLabel.text = question.options[i];
            NSNumber *result = question.selectedResults?question.selectedResults[i]:@0;
            optionView.selected = result.boolValue;
        }
    }
}

#pragma mark - 选项被选中或取消
-(void)optionSelected:(UITapGestureRecognizer *)tap {
    NSInteger currentIndex = tap.view.tag - 400;
    YJNFormOptionView *optionView = (YJNFormOptionView *)tap.view;
    optionView.selected = !optionView.selected;
    switch (_style) {
        case YJNChooseStyleSingle: {
            NSArray *selectedIndexs = [self p_getSingleOptionAtIndex:currentIndex];
            if (self.selectedResultBlock) {
                self.selectedResultBlock(selectedIndexs);
            }
        }break;
            
        case YJNChooseStyleMulty: {
            if (self.selectedResultBlock) {
                NSArray *selectedIndexs = [self p_getMultyOptionResults];
                self.selectedResultBlock(selectedIndexs);
            }
        }break;
            
        default:
            break;
    }
}

-(NSArray *)p_getSingleOptionAtIndex:(NSInteger)index {
    NSMutableArray *mutableIndexs = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i = 0; i < _currentQuestion.options.count; i ++) {
        YJNFormOptionView *option = [_optionViews objectAtIndex:i];
        if (i != index) {
            option.selected = NO;
        }
        NSNumber *choice = [NSNumber numberWithBool:option.selected];
        [mutableIndexs addObject:choice];
    }
    return mutableIndexs;
}

-(NSArray *)p_getMultyOptionResults {
    NSMutableArray *mutableIndexs = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i = 0; i < _currentQuestion.options.count; i ++ ) {
        YJNFormOptionView *option = [_optionViews objectAtIndex:i];
        NSNumber *choice = [NSNumber numberWithBool:option.selected];
        [mutableIndexs addObject:choice];
    }
    return mutableIndexs;
}

#pragma mark - Property
-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"Title";
        _titleLabel.font = [UIFont systemFontOfSize:14.0f];
        _titleLabel.textColor = [UIColor colorWithRed:0.26 green:0.26 blue:0.26 alpha:1.0];
    }
    return _titleLabel;
}

-(NSMutableArray *)optionViews {
    if (!_optionViews) {
        _optionViews = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return _optionViews;
}

@end
