//
//  YJNFormChooseView.h
//  FunctionTestProduct
//
//  Created by YangJing on 2017/10/20.
//  Copyright © 2017年 YangJing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,YJNChooseStyle){
    YJNChooseStyleSingle = 0,
    YJNChooseStyleMulty  = 1
};
@class YJNQuestionModel;
@interface YJNFormChooseView : UIView
@property (nonatomic, copy) void(^selectedResultBlock)(NSArray <NSNumber *>* selectedIndexs);

-(void)configViewWithQuestion:(YJNQuestionModel *)question;
@end
