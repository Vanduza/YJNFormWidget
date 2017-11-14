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

#import "ChooseListTableViewController.h"
#import "UnderlineTextViewController.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) UITableView *formTable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_initData];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"XMessageResource.bundle/no_chat_icon"]];
    
    [self.view addSubview:self.formTable];
    [_formTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(void)p_initData {
    _dataArr = @[@"选择视图",@"带下划线的文本视图"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = _dataArr[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {//Choose
        ChooseListTableViewController *choose = [[ChooseListTableViewController alloc] initWithStyle:UITableViewStylePlain];
        [self.navigationController pushViewController:choose animated:YES];
    }else if (indexPath.row == 1) {//UnderlineTextView
        UnderlineTextViewController *uvc = [[UnderlineTextViewController alloc] init];
        [self.navigationController pushViewController:uvc animated:YES];
    }
}

-(UITableView *)formTable {
    if (!_formTable) {
        _formTable = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _formTable.delegate = self;
        _formTable.dataSource = self;
    }
    return _formTable;
}


@end
