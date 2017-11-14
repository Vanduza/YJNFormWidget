//
//  YJNQuestionModel.h
//  FunctionTest
//
//  Created by YangJing on 2017/10/24.
//  Copyright © 2017年 YangJing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,YJNChooseStyle){
    YJNChooseStyleSingle = 0,
    YJNChooseStyleMulty  = 1
};

@interface YJNQuestionModel : NSObject
/**问题ID*/
@property (nonatomic, copy) NSString *questionID;
/**问题题干*/
@property (nonatomic, copy) NSString *content;
/**问题的可选项数组*/
@property (nonatomic, strong) NSArray *options;//内部对象为NSString类型
/**标注问题选择类型*/
@property (nonatomic, assign) YJNChooseStyle type;
/** 选择结果 */
@property (nonatomic, strong) NSArray *selectedResults;//内部对象为NSNumber类型，如多选结果为（0,0,1,1）,单选结果为(0,1,0,0),最多有10个选项;
/**标记当前问题所处位置*/
@property (nonatomic, assign) NSInteger index;

@end
