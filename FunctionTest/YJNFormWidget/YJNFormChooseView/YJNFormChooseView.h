//
//  YJNFormChooseView.h
//  FunctionTestProduct
//
//  Created by YangJing on 2017/10/20.
//  Copyright © 2017年 YangJing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YJNQuestionModel;
@interface YJNFormChooseView : UIView
@property (nonatomic, copy) void(^selectedResultBlock)(NSArray <NSNumber *>* selectedIndexs);
-(void)yjn_prepareForReuse;
-(void)yjn_configViewWithQuestion:(YJNQuestionModel *)question;
@end
