//
//  YJNFormChooseTableViewCell.m
//  FunctionTestProduct
//
//  Created by YangJing on 2017/10/20.
//  Copyright © 2017年 YangJing. All rights reserved.
//

#import "YJNFormChooseTableViewCell.h"
#import "YJNFormChooseView.h"
#import "Masonry.h"

@interface YJNFormChooseTableViewCell()
@property (nonatomic, strong) YJNFormChooseView *chooseView;
@property (nonatomic, strong) YJNQuestionModel *currentQuestion;
@end
@implementation YJNFormChooseTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_initCell];
    }
    return self;
}

-(void)p_initCell {
    _chooseView = [[YJNFormChooseView alloc] init];
    __weak typeof(self) weakSelf = self;
    _chooseView.selectedResultBlock = ^(NSArray<NSNumber *> *selectedIndexs) {
        if (weakSelf.selectResultBlock) {
            weakSelf.selectResultBlock(weakSelf.currentQuestion.index, selectedIndexs);
        }
    };
    [self.contentView addSubview:_chooseView];
    [_chooseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

-(void)configCellWithQuestion:(YJNQuestionModel *)question {
    _currentQuestion = question;
    [_chooseView configViewWithQuestion:question];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

-(void)prepareForReuse {
    [super prepareForReuse];
}

@end
