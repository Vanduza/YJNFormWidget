//
//  YJNFormChooseTableViewCell.h
//  FunctionTestProduct
//
//  Created by YangJing on 2017/10/20.
//  Copyright © 2017年 YangJing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJNQuestionModel.h"

@interface YJNFormChooseTableViewCell : UITableViewCell
@property (nonatomic, copy) void(^selectResultBlock)(NSInteger currentIndex, NSArray *result);
-(void)configCellWithQuestion:(YJNQuestionModel *)question;
@end
