//
//  YJNFormTextAreaView.h
//  XMessageChatDemo
//
//  Created by YangJing on 2017/11/3.
//  Copyright © 2017年 杨敬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJNFormQuestionConfigProtocol.h"

@interface YJNFormTextAreaView : UIView <YJNFormQuestionConfigProtocol>
@property (nonatomic, copy) void(^contentReturnBlock)(NSString *content);
@end
