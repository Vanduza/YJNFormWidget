//
//  ViewController.m
//  FunctionTest
//
//  Created by YangJing on 2017/10/20.
//  Copyright © 2017年 YangJing. All rights reserved.
//

#import "ViewController.h"
#import "YJNFormChooseView.h"
#import "YJNQuestionModel.h"
#import "Masonry.h"
#import "YJNFormChooseTableViewCell.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) UITableView *formTable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_initData];
    [self.view addSubview:self.formTable];
    [_formTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(void)p_initData {
    _dataArr = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i = 0; i < 10; i++) {
        YJNQuestionModel *question = [[YJNQuestionModel alloc] init];
        question.questionID = [NSString stringWithFormat:@"%d",i + 100];
        question.content = [NSString stringWithFormat:@"问题内容%d",i];
        question.options = @[@"好",@"不好",@"可以",@"不可以"];
        question.type = i%2 ? YJNChooseStyleSingle : YJNChooseStyleMulty;
        [_dataArr addObject:question];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YJNFormChooseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChooseCell"];
    YJNQuestionModel *question = _dataArr[indexPath.row];
    question.index = indexPath.row;
    
    cell.selectResultBlock = ^(NSInteger currentIndex, NSArray *result) {
        question.selectedResults = result;
        NSString *temp = @"";
        for (NSNumber *selected in result) {
            temp = [temp stringByAppendingString:[NSString stringWithFormat:@"%@",selected]];
        }
        NSLog(@"%@", temp);
        NSLog(@"changed index:%d,result=%@",(int)currentIndex,temp);
    };
    
    [cell configCellWithQuestion:question];
    return cell;
}

-(UITableView *)formTable {
    if (!_formTable) {
        _formTable = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _formTable.delegate = self;
        _formTable.dataSource = self;
        [_formTable registerClass:[YJNFormChooseTableViewCell class] forCellReuseIdentifier:@"ChooseCell"];
        _formTable.estimatedRowHeight = 240;
        _formTable.rowHeight = UITableViewAutomaticDimension;
    }
    return _formTable;
}


@end
