//
//  ChooseListTableViewController.m
//  FunctionTest
//
//  Created by YangJing on 2017/10/30.
//  Copyright © 2017年 YangJing. All rights reserved.
//

#import "ChooseListTableViewController.h"
#import "YJNFormChooseView.h"
#import "YJNQuestionModel.h"
#import "Masonry.h"
#import "YJNFormChooseTableViewCell.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface ChooseListTableViewController ()
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation ChooseListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_initData];
    [self p_initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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

-(void)p_initView {
    [self.tableView registerClass:[YJNFormChooseTableViewCell class] forCellReuseIdentifier:@"ChooseCell"];
    self.tableView.estimatedRowHeight = 240;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
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

@end
